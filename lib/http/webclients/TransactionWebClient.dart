// ignore_for_file: file_names
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../models/transaction.dart';
import 'dart:convert';

const String url = 'http://172.19.240.1:8080/transactions';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 10));

    final Response response = await http.post(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson).timeout(const Duration(seconds: 5));

      

    if (response.statusCode != 200) {
      _throwHttpError(response);
    }
   
    return Transaction.fromJson(jsonDecode(response.body));
  }


  // Tratamento de erros

  void _throwHttpError(http.Response response) {
    throw Exception(_statusCodeResponses[response.statusCode]);
    
  }

  static final Map<int, String> _statusCodeResponses = {  
    
    400: 'Ocorreu um erro ao salvar a transação',
    401: 'Falha na autenticação',
    409: 'Transação já existente',
    422: 'Transação inválida',
    500: 'Unkown error',
  };
}
