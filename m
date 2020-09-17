Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11F726E855
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 00:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgIQW0k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Sep 2020 18:26:40 -0400
Received: from sonic317-27.consmr.mail.bf2.yahoo.com ([74.6.129.82]:45223 "EHLO
        sonic317-27.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725886AbgIQW0k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Sep 2020 18:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1600381598; bh=Ruh8whhsLaTTwjIXmzA3PCfAl+J0v/p4XdxCHWadIAE=; h=Date:From:Reply-To:Subject:References:From:Subject; b=kuF0v6XJvsZ0aflQnztt4uWTYY528j9OOCvFNBjeTwBA9mji6gLa9E2v//RnKPsLKAWktzwsh/2gZvWHKaG1xWE6AkgxjRb/qTa2TsZc0NTN/iq91VCBkQlGds0jcA0VIN9E7xWeD+6U/mHRncIWdSYrZ4ToGso5+zUuotc1lS1fUyQkcJGV6YC8jJ2/4S42cKyE+ECLOnp1KUYm1QKxL4ETMyS+cdvWZHxo8txOrs+k46XQMcVktDPASnt1p1NI7kOIjLfW8NUgNh9RQBAh6wTaaB3ojftrLP2R8EIZlK8iu0V1KtIAuNBp7FYXB1CMlhSIWfNV/spYEDbg1WjM1A==
X-YMail-OSG: 6aLDAv0VM1nD5LQqYbQMZDpHTLx.VOFZamSvRT2lpEDOzm64rJ8AVzlddLtuXJi
 iAw9D2ABk8MXPEGwHs8Q4QZfkVCV9kuyP_YcVUhrq3RPFF3gZ_gkV7VeZsjZOrmNzYvO9Okv9drU
 .dQxcBT3iKKwcOv.POH0XQ_kXsxbA9PzqPr7teMGZqdlefpzpFcDy6XAOwXLrjJFfEH6PZ7wrK7L
 yyxkYRZIuAZPxsEL2u1NiCLXQJxv.vIyl2yfpDiu6YBAFmBPXlqxBZdSW7kRH33_8lb6HMII2alC
 HEKPk.EC9sddHRo6rMcf8QIpIC41DEN6Ana0bkeZE3v67jvoQPOXuIAR7FfRmj3Au9nsJGAZTGtQ
 j3UYw6iDpdufNtLFrJEguoAV9yqiaHQXTmk617mlUoTk4PpbcUu1pCFuAp8AJcMzqiY9KIdKYKsT
 dzjQ_74B7qCaL.aDYH2C4lklEgHDI3yViQj3MAemLKac2a5ybChu_ROxvAxc6CJgagnATeU9r9zw
 mH1.uG0VrUE.ZZC1Nm_ZogdyM0H4bP4.aukHvqaNuKUG.w7dzbZDz17FSY_Vt8dTkF7tm9lB4ZCs
 uJxi1d7HJKsCo5BMEYdbgrlTYUnDz_2trHubm.TAX5zNvkGmaJ4FgH_mJwhvTSWJj896Q9tKBzvA
 3wrSxoYHHT39s7dJF5PaVCd97yh8TxE7EVlfY0LA3RvbdWAGp7PY31NExXOpSHXcsvkiJ7mxTVrF
 kLJEIcGbwEw6Wd4NU9HeEqfOE831U9PuJ6y5qIZt1pw4vw0SPSBETg6TXBseW5GQI1MplHVCEj8p
 KhH38lx7YIKbqMhsjzePU.hGuTp1.hCiS8Unc_.kXS07RTQu8Xjd3FNQCUDFvxiv_lCenBJZmcw8
 u1yP1k4wd8G8tclXSnw6_l0twFtkdTqkG8xo8_3snjStRcd_E6Ti_Ff5dZ8JwmxqVKAAQMdPHPkA
 0DV_8SczeK_wK0d35neBgstObVcM5ZknA3JJNKMhgkcMAOgjUfO1FKKKPKBskUKmF6Bw4RTQ9OwU
 VVSb4Ho6bYzN6ACVRoF.gRsPVTWCL0E_OnzlUSY4rUU5JTAQzllon0HPZWeUJloCLg.yJjnJkF4e
 mpPnlzXQ7mE3RyHJEljSgHnOPsg.6UwP__MDFM4nY2Spzu_YwtwuWJIWN2EiCIo_aLse8.iKBiY9
 xGcH56NgQ_4YGczZWwZaV_QCZm_ht6paAPCDhlfAzXzeQQtRPoGcfajpe81TO7J3hFCCdjn1G0lM
 kR_qKWXzF_itcrzPHh9F0yI8A3uSqMYMlF_wGzSbkpTnxP9wQIOA72koX.JWFIUBsiBhof3t.IgV
 9tOwm4SsSpq5qTmlo.D40ujEKJ_TFNHNkguHDOxPHI5nJpyuRPrDMiy7casejgtKBe0RqlrQeUoo
 fvuwG6t.2Hug.dcPPeE5QKvstSQ5yLTs4ukfZMsC9YfpwEZCIZA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Thu, 17 Sep 2020 22:26:38 +0000
Date:   Thu, 17 Sep 2020 22:26:37 +0000 (UTC)
From:   Ms Theresa Heidi <james29234@gmail.com>
Reply-To: mstheresaaheidi@yahoo.com
Message-ID: <2063055513.3395755.1600381597639@mail.yahoo.com>
Subject: =?UTF-8?B?57eK5oCl44Gu5Yqp44GR44GM5b+F6KaB44Gn44GZ77yB?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <2063055513.3395755.1600381597639.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16583 YMailNodin Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dear Beloved One,=20

 CHARITY DONATION Please read carefully, I know it is true that this letter=
 may come to you as a surprise. nevertheless,i humbly ask you to give me yo=
ur attention and hear me, i am writing this mail to you with heavy sorrow i=
n my heart,i have chose to reach you through Internet because it still rema=
ins the fastest medium of communication after going through your profile.

My name is Mrs Theresa Heidi i am native France currently hospitalized in a=
 private hospital here in Israel as a result of lungs cancer I am 62 years =
old and I was diagnosed of lungs cancer for about 4 years ago, immediately =
after the death of my husband, who has left me everything he worked for. I'=
m with my laptop in a hospital here in where I have been undergoing treatme=
nt for cancer of the lungs

Now that is clear that I=E2=80=99m approaching the last-days of my life and=
 i don't even need the money again for any thing and because my doctor told=
 me that i would not last for the period of one year due to Lungs cancer pr=
oblem.I have some funds inherited from my late husband, the sum of $15 Mill=
ion United State Dollars ( US$15,000,000,00 ),This money is still with the =
foreign bank and the management just wrote me as the true owner to come for=
ward to receive the money for keeping it so long or rather issue a letter o=
f authorization to somebody to receive it on my behalf since I can't come o=
ver because of my illness or they may get it confiscated.

I need you to help me withdraw this money from the foreign bank then use th=
e funds for Charity works/assistance to less privileged people in the socie=
ty.It is my last wish to see that this money is invested to any organizatio=
n of your choice.

I decided to contact you if you may be willing and interested to handle the=
se trust funds in good faith before anything happens to me.This is not a st=
olen money and there are no dangers involved, is 100% risk free with full l=
egal proof.

I want you to take 45 percent of the total money for your personal use whil=
e 55% of the money will go to charity. I will appreciate your utmost confid=
entiality and trust in this matter to accomplish my heart desire, as I don'=
t want anything that will jeopardize my last wish.
       =20
Yours Beloved Sister.
Mrs Theresa Heidi
