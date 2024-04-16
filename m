Return-Path: <linux-kbuild+bounces-1583-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F043A8A646F
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Apr 2024 09:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2288281720
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Apr 2024 07:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AA76DD1D;
	Tue, 16 Apr 2024 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="uOpnqDlw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sonic307-20.consmr.mail.sg3.yahoo.com (sonic307-20.consmr.mail.sg3.yahoo.com [106.10.241.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8576DCE8
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Apr 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713250855; cv=none; b=YL/vHjgr+IBOOsEm+a9YzH36zayxXDPfVi7bcli5JphDCzToUy0nGsvJjPK98MlK+qr7T7AmiBjXVHMCUspPjYvN6xTtdF2bBCRpbLlyxY0/33xbd+z/3ge+5o4471In1aybyli8MjyhD4xlD7STdApvwj7gGFF7QaervSp3Noo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713250855; c=relaxed/simple;
	bh=SCRcdjo5uSjh38rIVERk3UkFvROpCipIGv2XE9YNABk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=gXyLWlvC13I0OFBKTxji+A810000zeXnPL13pmYoYhQdooJ8A15kFE0pL0/gCvuO7bj/1b1nFx5I5sm5W/OG3agdMg1HP1wJqhStvkpdtvDOC5UiR7S0As8yBPy71DSzggnsqJSktJe1oewlvWZCbapDVBpuaVTy97UT6u0JbP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=uOpnqDlw; arc=none smtp.client-ip=106.10.241.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713250846; bh=SCRcdjo5uSjh38rIVERk3UkFvROpCipIGv2XE9YNABk=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=uOpnqDlwmijgC084CcgMHgCBiZW8K1TOEyN7V9f8Pp+GFcw2cnHwi8z3IKmuKPBw0KBCgjJqnv1w4L1I7EER3Pb7EvULbobWLLTCKO+3ST+jeJilzCSP09LJo7JWOwF4RImyE/146VL0WdnKYm+TUrRRIlT8BKxXRSHttcBD/Gg5WN4igroxT6YIVornMPjok0ZYS8o8CoRZJ+Wp5Qgckd+uuGd5aPNGOlYsZcjuBQTJIttrfNIOBch5xem9bGK4kXXeU1fzMTr4piOxrlk85LX0H1hhEElgjmnX+qK1JwNPw6s4plLs+6jXN6a+DAb8b3mUUyiBZuMQo/2jBLUwmA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713250846; bh=v5VniQ+wqPt2ntYW+GxLKZkmJlK5Lnl5kqY26kVvipD=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=fFi5cB9UEpDxL1w3FVBfsyEMSzlIOj1flTCZckqFrrXhR2DoDzN3UNOdQuN/G/i5QjP+qzZPHYg6OeUM+ej8yvF2lRoLCPugDdII2R/nU3abUE2Rgc3RssBeJ3nchFB3jKQYfIdYCWhdyoTe1eyhqGrswyYn0U+/F9WAl32ie5KelmKjQmfd94y2H+soUba8/vJJ9kgitz2TVcimckmpzqw5wprvuP+IekRbO9R+X7I+58rndhJekelvzR295tS06vHUyk1cqk5JVeff/beWBYZ4/8WMrONn82zDpI36L+1rXGkMpftkPQI808e9LsRjBzYLo2iw5/BrICvHVHKqfA==
X-YMail-OSG: fhR9c.oVM1nFCUGDmMnRTiH0zIQk8h9yc_4Gg0PT0cZthRDDq6Da1tz1VDABsV8
 SJPfSTQTNP0x40mH1JZ4Tw_tgb4VSHStja0QfUJ_hAu3OuFxws8Ja4F.NJtA8mi22PQFx9PHwALg
 r3ewephBGDrGQAnAtU9CbaZUXX9j6DnJy_eSnRmotX8HQOEt89.SLw7sAQYB2PUVO_URdX9gjQTh
 rRy09jxn45op8dyzUNBuJQWHfNkT2mRzfIutZtAsJH1qTWwvhsm_7liDbNbPHqeKS2nWFEADz2cN
 OEN0ED3_gX1LWswG10eWSohN2M8hDjSmPVAcsME25ZF2xlDEUCq4Ks.qlOIg33.OTfw5d7r882TF
 emQlgw9NtnzEQRr7Cp7zSB2boqaZN75Et1xiHpwOLJ9jTYVF4468NC47T9HEzYCjnaN8eDbwiRe_
 l8QdVyTD2ngUVWQyUa84XREXg17TetwpCkXgBt6IozFlhr9RooAHbMNDZ4oHocVRdSsrbhL4k2o1
 6iUUsD3kANdea2mPtsfog6W07BslqjgMFATFSkEl3PKSTu4RPgQRuRKX4Vee00aFFugsyHkPmJXl
 tSwN5CCr.XLF8SL139RGzA8_nt6W8RRgFn9p1RIo36dq2TP8XC7uYFtvn4n2XyCek2PEzmqgjOcu
 o0UBtW_XhPeMKfpX9w7lyDGU3qUbwGMrY0g7tVij737FitO1GR18Om0xkQ5tUT4OY6SWIH5NnHX3
 0p7dATGdM0kK0syTKj001ukZ2YA.NgfUZhedUoTULgpvxOuxDcCMHhYKjqgmS3wHt91jIKDsuWzG
 ta7r1kWjyRNOxuCSOLkkI7YIoWRBYxbFeqWaOEfapIBzNi1JbUY3XGhQDSLkw2B4SKLBLClieEJy
 8S6xUWBshjHzZWPgXJbbvJbomz9zSX6F7UdecvqipVYUo5V.XEvKLdIS0i.qAbJ8vFj973uuG2eG
 69r59toLLy5l.d3pPEGmhk52OYHsQRPD9Brq2do1A3DVwyg2KXermQNTm4mkD3cm0r_Zp2ySBxP0
 MYa.N90DCIaWKzGTENo7nIxWr3d.b0jmPp5T617UPGQCEzNf9fwtjBmVGNfpKwCwrawAT6_0UUkt
 MX0HiznBSXFO9BLA9Or1sRHzoOtSKblNMrgvVVVsXYPCMql_8NsGflpJ_HhJviza0JHWplIl9mM5
 BnScJ4IDA7Luh0kUZajECykeUUaZgnMuC8O.eIxmbVV8DPIY1p0MP7ekPwNoscc3chC0zLKLUbEk
 tTP5kRfvJCSN9lzIEe6ojsKkLxErvfcpsSJdQCEvf0E1aoN1ptlLHIPXH1dZDWtJjEpmW_cAb1CG
 ZwwQiwh9hL7T7M5RivUMnl4hlZuxlz7NXFIBt54S_q3T0e1e5GTy7YXra77WuWt5uMjiuB656ag.
 sttWxpbFQ6W8tlXflrb0Ac5FDDXgF8w4erBNAAyLMlal20igYcPf3UJhXxRjQlY5HH4ha6k5xd.c
 RByv4SECNrcAMUTgMIdnQ8DjdRdxXSCb8Ek4dGzDOlKcZiSUA17ChdSjEWzA9GEAvFV6rtdGfUem
 tRLt1AvKnmb3QfGuhasS7qslVh.tvQMQhD3.WzaWpYgErIOpSHHPPCYq37wFZDxlYAhX6aGc9212
 gg_y_MqJ1r0BeJ9fCzi3KAM0RZiD3cAAwBQqU9yUaKdndGMEEVBLaBAF.FIGH4tPRKcMoLlXdcRx
 xPGt_eYe66tc7A1m4UcB9R6n9cB_2_ATKS7WOsFXL.0Fu4yMGhu0wBvc7iwJpx0.QxSoudH6eCHL
 ks1c0t2tFQ1xYvCrYZ_63UWDCk6R3LsEHLVhtTpumAWTqF5nLcs9wd_LCnb6MVa6KBTgcyOwBIfx
 qzu9MCMuNB2seqbIiq7w.pbgaSnON.OavHYqGrCB6UlX6tsfjiiS7HjcttSVjmpbColkC8PNta2D
 trSxhnuO.IYcVGtYx9BCnJ2aQwAsY4Ki7.hYuoovjzKRWiCgcfSgznHeWfByyRCkoGoqJoIyT6Zy
 7S6vESWpx0q_DZGjus0oM.UKXNJ9pFLo6K71Jvm4QRZyso7WYVGKw.mNA1ceqeIwpJ4cU5._470V
 faCmwsn3t7587a_Q6sH1PauMepHbtqVcrvAYN9edXWw93XHeh8T8favi7j_v2wfmySgmAl8o2kim
 QpqhozrOms8n6hvPW_WJqc0PsZeHXkykNzGBHJKFB8piM0dECJavK3MJhUYMHYhDOjDt3bUQZNqN
 C6KiAPJZhe8tDRODgnfpih.gjrL.4WTePXtNv4p16I.p31.cJo1ygnHOOa2gcAIy4l2YLIzf3XRQ
 X_5Fi3mwxDs3Yx4FXC2i48Lk-
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: ec54d4b9-5223-477c-bd01-d1550e1c37b9
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.sg3.yahoo.com with HTTP; Tue, 16 Apr 2024 07:00:46 +0000
Date: Tue, 16 Apr 2024 06:50:27 +0000 (UTC)
From: Prasad Pandit <pjp@fedoraproject.org>
Reply-To: Prasad Pandit <pj.pandit@yahoo.in>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <1227781620.5938729.1713250227417@mail.yahoo.com>
In-Reply-To: <20240407072933.3562124-1-ppandit@redhat.com>
References: <20240407072933.3562124-1-ppandit@redhat.com>
Subject: Re: [PATCH v1] kconfig: add config and source entry details
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22205 YMailNorrin

>On Sunday, 7 April, 2024 at 12:59:48 pm IST, Prasad Pandit wrote:=C2=A0
>From: Prasad Pandit <pjp@fedoraproject.org>
>
>Add details to the 'config' and 'source' entry description,
>to make it unambiguous. It'd come handy as reference for
>Kconfig language or patch reviews for Kconfig source files.
>
>Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
>---
>Documentation/kbuild/kconfig-language.rst | 18 +++++++++++++-----
>1 file changed, 13 insertions(+), 5 deletions(-)
>

->=C2=A0https://lore.kernel.org/linux-kbuild/20240407072933.3562124-1-ppand=
it@redhat.com/T/#u


Ping...!(just checking)
---
=C2=A0 - Prasad

