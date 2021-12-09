/*=============== Owned packages ===================*/
import 'package:citydanger/locator.dart';
import 'package:citydanger/enums/dialog_type.dart';
/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.Header: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        Dialog(
          backgroundColor: Colors.transparent,
          child: _BasicCustomDialogwithHeader(
            dialogRequest: dialogRequest,
            onDialogTap: completer,
          ),
        ),
    DialogType.HeaderOk: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        Dialog(
          backgroundColor: Colors.transparent,
          child: _BasicCustomDialogwithHeaderOK(
            dialogRequest: dialogRequest,
            onDialogTap: completer,
          ),
        ),
    DialogType.DeleteCertification: (BuildContext context,
            DialogRequest dialogRequest, Function(DialogResponse) completer) =>
        Dialog(
          backgroundColor: Colors.transparent,
          child: _BasicCustomDialogCertifications(
            dialogRequest: dialogRequest,
            onDialogTap: completer,
          ),
        )
  };
  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicCustomDialogwithHeader extends HookWidget {
  final DialogRequest? dialogRequest;
  final Function(DialogResponse)? onDialogTap;
  const _BasicCustomDialogwithHeader(
      {Key? key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width,
          height: 300,
          padding: const EdgeInsets.only(
              top: 40.0, left: 5.0, right: 5, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 85.0,
                ),
                Text(
                  dialogRequest!.title!,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const  SizedBox(
                  height: 10.0,
                ),
                Text(
                  dialogRequest!.description!,
                  textAlign: TextAlign.center,
                  style:const TextStyle(color: Colors.black),
                ),
               const SizedBox(
                  height: 45.0,
                ),
                Container(
                    child: GestureDetector(
                  onTap: () => onDialogTap!(DialogResponse(confirmed: true)),
                  child: Container(
                    child: dialogRequest!.showIconInMainButton!
                        ? const Icon(Icons.check_circle)
                        : Text(
                            dialogRequest!.mainButtonTitle!,
                            style:const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                shape:const CircleBorder(
                  side: BorderSide.none,
                ),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  radius: 50.0,
                  child: dialogRequest!.customData,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BasicCustomDialogwithHeaderOK extends HookWidget {
  final DialogRequest? dialogRequest;
  final Function(DialogResponse)? onDialogTap;
  const _BasicCustomDialogwithHeaderOK(
      {Key? key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width,
          height: 300,
          padding: const EdgeInsets.only(
              top: 40.0, left: 5.0, right: 5.0, bottom: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding:const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 100.0,
                ),
                Text(
                  dialogRequest!.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const  SizedBox(
                  height: 35.0,
                ),
                Container(
                    child: GestureDetector(
                  onTap: () => onDialogTap!(DialogResponse(confirmed: true)),
                  child: Container(
                    child: dialogRequest!.showIconInMainButton!
                        ? const Icon(Icons.check_circle)
                        : Text(
                            dialogRequest!.mainButtonTitle!,
                            style:const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                shape:const CircleBorder(
                  side: BorderSide.none,
                ),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  radius: 50.0,
                  child: dialogRequest!.customData,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BasicCustomDialogCertifications extends HookWidget {
  final DialogRequest? dialogRequest;
  final Function(DialogResponse)? onDialogTap;

  const _BasicCustomDialogCertifications(
      {Key? key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String isOkFlag = "NOT_OK";
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width - 100,
          height: 290,
          padding: const EdgeInsets.only(
              top: 40.0, left: 5.0, right: 5, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding:const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 85.0,
                ),
                Text(
                  dialogRequest!.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               const SizedBox(
                  height: 10.0,
                ),
                Text(
                  dialogRequest!.description!,
                  textAlign: TextAlign.center,
                  style:const TextStyle(color: Colors.black),
                ),
               const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () => {
                          isOkFlag = "OK",
                          onDialogTap!(DialogResponse(
                              data: isOkFlag, confirmed: true)),
                        },
                        child: Container(
                          child: dialogRequest!.showIconInMainButton!
                              ?const Icon(Icons.check_circle)
                              : Text(
                                  dialogRequest!.mainButtonTitle!,
                                  style:const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 120,
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                   const SizedBox(
                      width: 20,
                    ),
                    Container(
                        child: GestureDetector(
                      onTap: () => onDialogTap!(DialogResponse(confirmed: true)),
                      child: Container(
                        child: dialogRequest!.showIconInMainButton!
                            ?const Icon(Icons.check_circle)
                            : Text(
                                dialogRequest!.secondaryButtonTitle!,
                                style:const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 120,
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                shape:const CircleBorder(
                  side: BorderSide.none,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 50.0,
                  child: dialogRequest!.customData,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
