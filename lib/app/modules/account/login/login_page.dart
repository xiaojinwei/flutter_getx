import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getx/app/modules/account/login/login_controller.dart';
import 'package:flutter_getx/app/widgets/dynamic_flutter_logo.dart';
import 'package:flutter_getx/app/widgets/status_views.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("log_in".tr),
        centerTitle: true,
      ),
      body: new Container(
        child: new Padding(
          padding: new EdgeInsets.fromLTRB(32, MediaQuery.of(context).padding.top + 32, 32, 32),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  child: new Center(
                    child: new DynamicFlutterLogo(180),
                  )
              ),
              LoginForm(context),
            ],
          ),
        ),
      ),
    );
  }

  final _formKey = new GlobalKey<FormState>();

  FocusNode _passwordFocusNode = FocusNode();

  String? _username;
  String? _password;

  bool _submit(){
    var formState = _formKey.currentState;
    var validate = formState?.validate()??false;
    if(validate){
      formState?.save();
    }
    return validate;
  }

  Widget LoginForm(BuildContext context){
    return new Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(labelText: "enter_username".tr),
              cursorColor: Theme.of(context).primaryColor,
              validator: (val) =>
              val?.isEmpty??false ? "enter_username_error".tr : null,
              onSaved: (val) => _username = val,
              onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(_passwordFocusNode),
            ),
            new TextFormField(
              decoration: new InputDecoration(labelText: "enter_password".tr),
              cursorColor: Theme.of(context).primaryColor,
              validator: (val) =>
              val?.isEmpty??false ? "enter_password_error".tr : null,
              onSaved: (val) => _password = val,
              focusNode: _passwordFocusNode,
              obscureText:true,
              onFieldSubmitted: (value) => _submit(),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 20),
              child: controller.logging.value ? ProgressView() : IconButton(
                icon: Icon(Icons.done,color: Theme.of(context).primaryColor,),
                onPressed: (){
                  if(_submit())
                    controller.login(context,_username!,_password!);
                },
              ),
            )
          ],
        )
    );
  }

}