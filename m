Return-Path: <linux-kbuild+bounces-9678-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21090C6F16D
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 14:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32F6F505923
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 13:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8D1363C77;
	Wed, 19 Nov 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZB0fy+cS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BDD3624D5
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558899; cv=none; b=Cd9/TI0Eqm5tojkmXo4XRNX3Gwjt8swkdvOotSQoOv2JD7hbcCVeTVKDPBgwYKHyFwkDdVBWF87crKuVF2tFFVxxbfIHNfdAHy66ozY6yjTHckGpPcI/XnYPacm9MiVxeqBZyNFkHU2AqCC0LZBb0POt6xzyhPxLM4RnjfdBBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558899; c=relaxed/simple;
	bh=gHpwjjREhsAd8WKsVYT8IYp6+ZQIN7Tnm8WoUEA8aZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnF1XV6j/WxrOKA3C+4qJukR+D+dfIKB0rO7/wb+b1IDlc5yrfgB5QFihLIiOMom4JyVWzpk6zSloIRQSRP2eOlsEDv/SvsWDQtVD0TKb18WyucpsnPD6c5A81v1tUk/0nsgYVE/zMTI7xkWjCIvl1QpfdAWMVN324Su5OErROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZB0fy+cS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so7299516e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763558893; x=1764163693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9Fz2SH1ZUm7FuuivONGxxUgBBznVGQP+s2/x19XhOc=;
        b=ZB0fy+cS1xYK9vha6Tv00U0twgMJFjTq4+9aYZ8hfvmNMqly9QfDD0oXfZNzwWRpbh
         JwGFoamRilDGXXJFFu9byVUjYTEGhBvrAkUaTW4zbHsxMiaCmJXWKWGGJ1wn+TY/2Aog
         twpOHdet9yu8ZPQAozLB0jDV4ur4E5xF7GGdhCc+mwzbml3XhLsLF/WkE3y/uHdyVfNy
         WSixf7XnPG58jugGaEQVpZRATC1hb9sAaUkNE1pRhY9SE4CtrJIfLMbXjMgDs4Jd1T0s
         TnaJUFkbVzs4/Wx5SLGTYQ+q9yG5OJixmqZG+sza1llI6xYIr6g9l8B5eKkFJLn7A4Bg
         BWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763558893; x=1764163693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9Fz2SH1ZUm7FuuivONGxxUgBBznVGQP+s2/x19XhOc=;
        b=L7O2PVizlZIAeUECHLMsfClOYEav9Z8xfQExH9uZwWN6Y0lBKr0tRi1CnrSPVTcKiO
         FS3i4Q519/ObcWGyLKtP/Y/+qRMSCipJbySLaVgiUKnbkKhmYx3+3ZcL0JO8tOlOZvQ3
         lcXVf6RcRCNDVbPQbxtXQLUbqUjRzxQLAgtX1QOusHroSSb8egwqlLfd06gkbyI99oYV
         yfyG3rktESveaeYjtHMwybqdB++vlJB4ooT4SnUD4sH9ULJPDRaQlwDG/bC+2pf782AX
         9XqeZ1J5xlCBdx+ToaI3JC0Sm6cuAnp8tx5IjJnycvs8iIiIGCpISqBtpZ95asSAEPTY
         0XSA==
X-Forwarded-Encrypted: i=1; AJvYcCV9jIaCyyBIWfKyoeOJqC1M5B0V4SsROZJt6ak5SvMRUM+PRLV/dLgXCcOCbTsRQNtEEVWh7GkKWaPHmtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwysrnADQoxchH12AxSgUqMJa/ywwBoOhkUo5QOKYaEpVbbPkYZ
	nN/krwX60qtQ9PECrW23PCWdKE7wcuwOLvUMH0gUJrqE2pItpdUpCPf4RuQ9q0S0pe6XD4EhlcN
	JnIAu6P4dM9xLnYXBKblpSbxsSPE9ddhV27UgZzdR2Q==
X-Gm-Gg: ASbGncsjGHdscebOosHGY+X9G7pbEYoyUJuAhwUpB3rIVKA0PGuWWuf+MDBEYWylqoQ
	6o2pxsv2kJci3Y50Hc6TtuiHY9XmZVIRs8Xcv1jWBvdaIELvwg/ldlxE0/Yetm0oJU6o7wOrqTG
	2F9uiyGQmVXrv8zwf/tU2VVvC1M3pVBTeJnpr2RdaaW/nepXsbaDGCbUj/IHxt/doGhrFSd+14T
	o9IwQjZ2ZemLvoHE5ywYrq/WNPb3dfXTxwJm9vhBl3oux85JoPFC8rzu7F5F+YsVs5WaK6v9EwW
	hM2cxAmHIAj6ssRhnNyC9UO5/85OrfTypJGY6y7oQnAlIRZI
X-Google-Smtp-Source: AGHT+IGJBnlU8SfCgN2H396Pf5rcfKBaHkLraBwus+9No1IWypEaF8w8j8PGxkXY9nu4VlhBBrtuUvloX+iTMlSUET4=
X-Received: by 2002:a05:6512:1326:b0:594:2cdf:1941 with SMTP id
 2adb3069b0e04-59604e3f4e4mr1143048e87.31.1763558892975; Wed, 19 Nov 2025
 05:28:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-pci-m2-e-v1-0-97413d6bf824@oss.qualcomm.com> <20251112-pci-m2-e-v1-9-97413d6bf824@oss.qualcomm.com>
In-Reply-To: <20251112-pci-m2-e-v1-9-97413d6bf824@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 14:28:00 +0100
X-Gm-Features: AWmQ_bm5iCKbfw8hpw1YVmAcjxIFk-iHf3DCtBX1MsQ5hHQ1VM87jgrdbOpF5Hc
Message-ID: <CAMRc=MeyeyuNVP6CWcxNp8XSCT+P9ZNmgSj6Hktrv8ZYNN5kMg@mail.gmail.com>
Subject: Re: [PATCH 9/9] power: sequencing: pcie-m2: Add support for PCIe M.2
 Key E connectors
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 3:45=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Add support for handling the power sequence of the PCIe M.2 Key E
> connectors. These connectors are used to attach the Wireless Connectivity
> devices to the host machine including combinations of WiFi, BT, NFC using
> interfaces such as PCIe/SDIO for WiFi, USB/UART for BT and I2C for NFC.
>
> Currently, this driver supports only the PCIe interface for WiFi and UART
> interface for BT. The driver also only supports driving the 3.3v/1.8v pow=
er
> supplies and W_DISABLE{1/2}# GPIOs. The optional signals of the Key E
> connectors are not currently supported.
>
> For supporting Bluetooth over the non-discoverable UART interface, the
> driver currently creates the serdev interface after enumerating the PCIe
> interface. This is mandatory since the device ID is only known after the
> PCIe enumeration and the ID is used for creating the serdev device.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>
> +static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
> +{
> +       struct pwrseq_pcie_m2_ctx *ctx =3D pwrseq_device_get_drvdata(pwrs=
eq);
> +
> +       gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);

Since this is new code and gpiod_set_value_cansleep() now returns an
integer, can you do

  return gpiod_set_value_cansleep()?

Same elsewhere.

>
> +static int pwrseq_m2_pcie_notify(struct notifier_block *nb, unsigned lon=
g action,
> +                             void *data)
> +{
> +       struct pwrseq_pcie_m2_ctx *ctx =3D container_of(nb, struct pwrseq=
_pcie_m2_ctx, nb);
> +       struct pci_dev *pdev =3D to_pci_dev(data);
> +       struct device_node *remote;
> +       struct serdev_controller *serdev_ctrl;
> +       struct serdev_device *serdev;
> +       struct device *dev =3D ctx->dev;
> +       int ret;
> +
> +       /*
> +        * Check whether the PCI device is associated with this M.2 conne=
ctor or
> +        * not, by comparing the OF node of the PCI device parent and the=
 Port 0
> +        * (PCIe) remote node parent OF node.
> +        */
> +       remote =3D of_graph_get_remote_node(dev_of_node(ctx->dev), 0, -1)=
;
> +       if (!remote || (remote !=3D pdev->dev.parent->of_node)) {
> +               of_node_put(remote);

You could really use some __free(device_node) here. It would simplify
the code below quite a bit and make sure you don't miss anything.

> +               return NOTIFY_DONE;
> +       }
> +       of_node_put(remote);
> +
> +       switch (action) {
> +       case BUS_NOTIFY_ADD_DEVICE:
> +               /* Create serdev device for WCN7850 */
> +               if (pdev->vendor =3D=3D PCI_VENDOR_ID_QCOM && pdev->devic=
e =3D=3D 0x1107) {
> +                       remote =3D of_graph_get_remote_node(dev_of_node(c=
tx->dev), 1, -1);
> +                       if (!remote) {
> +                               of_node_put(remote);
> +                               return NOTIFY_DONE;
> +                       }
> +
> +                       serdev_ctrl =3D of_find_serdev_controller_by_node=
(remote);
> +                       of_node_put(remote);
> +                       if (!serdev_ctrl)
> +                               return NOTIFY_DONE;
> +
> +                       serdev =3D serdev_device_alloc(serdev_ctrl);
> +                       if (!serdev)
> +                               return NOTIFY_DONE;
> +
> +                       ret =3D serdev_device_add(serdev, "WCN7850");
> +                       if (ret) {
> +                               dev_err(dev, "Failed to add serdev for WC=
N7850: %d\n", ret);
> +                               serdev_device_put(serdev);
> +                               return NOTIFY_DONE;
> +                       }
> +               }
> +               break;
> +       }
> +
> +       return NOTIFY_DONE;
> +}
> +
> +static bool pwrseq_pcie_m2_check_remote_node(struct device *dev, u8 port=
, const char *node)
> +{
> +       struct device_node *remote;

Same here.

> +
> +       remote =3D of_graph_get_remote_node(dev_of_node(dev), port, -1);
> +       if (remote && of_node_name_eq(remote, node)) {
> +               of_node_put(remote);
> +               return true;
> +       }
> +
> +       of_node_put(remote);
> +
> +       return false;
> +}
> +
> +/*
> + * If the connector exposes a non-discoverable bus like UART, the respec=
tive
> + * protocol device needs to be created manually with the help of the not=
ifier
> + * of the discoverable bus like PCIe.
> + */

I really like this idea BTW!

> +static void pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *=
ctx, struct device *dev)
> +{
> +       int ret;
> +
> +       /*
> +        * Register a PCI notifier for Key E connector that has PCIe as P=
ort 0
> +        * interface and Serial as Port 1 interface.
> +        */
> +       if (pwrseq_pcie_m2_check_remote_node(dev, 1, "serial")) {
> +               if (pwrseq_pcie_m2_check_remote_node(dev, 0, "pcie")) {
> +                       ctx->dev =3D dev;
> +                       ctx->nb.notifier_call =3D pwrseq_m2_pcie_notify;
> +                       ret =3D (bus_register_notifier(&pci_bus_type, &ct=
x->nb));
> +                       if (ret) {
> +                               dev_err_probe(dev, ret, "Failed to regist=
er notifier for serdev\n");

If this is optional and we don't handle the error, should we really
print it as one? I'd say a dev_dbg() would suffice unless the failure
here impacts the driver's behavior (which it does, so maybe the
notifier should not be optional?).

Bart

