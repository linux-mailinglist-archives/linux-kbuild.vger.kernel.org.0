Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6988B4B08F9
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Feb 2022 09:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238091AbiBJI4w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Feb 2022 03:56:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238096AbiBJI4w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Feb 2022 03:56:52 -0500
X-Greylist: delayed 371 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Feb 2022 00:56:53 PST
Received: from mail.trixen.pl (mail.trixen.pl [192.71.213.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AC61092
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Feb 2022 00:56:53 -0800 (PST)
Received: by mail.trixen.pl (Postfix, from userid 1001)
        id 068A440BAB; Thu, 10 Feb 2022 09:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trixen.pl; s=mail;
        t=1644483041; bh=J50dbWEn9x62xyxY1PWPtYxMwNMcDFoILqXfzM3his0=;
        h=Date:From:To:Subject:From;
        b=MQlsNLwd3O2tsiheTQkqeme9w3P5UvbOQ0n8yDvxwkh9uIl3+0UZ+7o65Wlg28B80
         Y0SKFdYiS4YOnuGoNufK4WxDH20UZoe+XS+dOLbYhfOrataVjUpvFTaW0BbbDqVZ3L
         oEFKcyZ1mAbUxv/5nNVlQcBLrZGsJH3jEC56bCeHf9rC+IUu3CvGuqBDg/U+lDb9mB
         Yk56Vj91rY5SPnlaXTMzT2HXDMcrn9M9mRsBe3e+KbLFCMysHSCrUDkTh26BBb4RsX
         xRry1QqeKGwJlf4krtKuBnHZDAlgGhMkkn1pXft6WyEhe9hBfXFlhR5nT2G/VfebUv
         mD6OgceY1KfUQ==
Received: by mail.trixen.pl for <linux-kbuild@vger.kernel.org>; Thu, 10 Feb 2022 08:50:34 GMT
Message-ID: <20220210084500-0.1.t.1u3j.0.dli4b4a26k@trixen.pl>
Date:   Thu, 10 Feb 2022 08:50:34 GMT
From:   =?UTF-8?Q? "Rados=C5=82aw_Grabowski" ?= 
        <radoslaw.grabowski@trixen.pl>
To:     <linux-kbuild@vger.kernel.org>
Subject: Monitorowanie samochodu
X-Mailer: mail.trixen.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dzie=C5=84 dobry,

Chcia=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re poprzez wyko=
rzystanie GPS monitoruje samochody w czasie rzeczywistym.=20

Dzi=C4=99ki temu mog=C4=85 Pa=C5=84stwo odczytywa=C4=87 wszelkie warto=C5=
=9Bci dotycz=C4=85ce np. zu=C5=BCycia paliwa czy obrot=C3=B3w silnika.

System automatycznie generuje rozbudowane raporty i pozwala dokonywa=C4=87=
 istotnych analiz.

Je=C5=BCeli interesuje Pa=C5=84stwa zwi=C4=99kszenie wydajno=C5=9Bci prac=
y i kontrola wszelkich parametr=C3=B3w floty - prosz=C4=99 o kontakt.


Pozdrawiam,
Rados=C5=82aw Grabowski
