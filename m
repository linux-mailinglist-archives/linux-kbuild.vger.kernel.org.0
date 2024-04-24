Return-Path: <linux-kbuild+bounces-1680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF548B014A
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Apr 2024 07:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBC171C215A5
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Apr 2024 05:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAD713CFAD;
	Wed, 24 Apr 2024 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="uJzCi9+F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sonic302-19.consmr.mail.sg3.yahoo.com (sonic302-19.consmr.mail.sg3.yahoo.com [106.10.242.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F79F15686D
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Apr 2024 05:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713937650; cv=none; b=jLC3SyS4+Rg9/IKXjwO+vbFGiOQ/336lBc9ZncA+5su/TaQmkYHnf/l5sR7OM+C/9SOjGTg1YK6ut5nQexsIoWOyiFnMPPiASopEeobAkTVl04DjFlSzG9HwrZQfs8QAg5W7vOCKJox5BCVGfp7QorB/zg89kvHx+vo1M1SnUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713937650; c=relaxed/simple;
	bh=yBCFN+0uYNfqHAi4eBFZ9PCyri9pdKl3X/NWKGw46RI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=DZM5OtRf4X7cEVN46BtnZQAxeWrc8QakqOWoZDJv1lZHKIXdL1cfrAkIKvQblM1jTo9YbicWgm6UrPWH+B3mVbiSlrNjJKWPv7xfvKQX6xsUZaH8KaNgfq/by4P61fqsvCiQrPwu5HrtazNX++v0oDKR0l+LWkTtZAUjtJc+8IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=uJzCi9+F; arc=none smtp.client-ip=106.10.242.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713937643; bh=yBCFN+0uYNfqHAi4eBFZ9PCyri9pdKl3X/NWKGw46RI=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=uJzCi9+FLC4EhHCkivqbdIZGS7HHin5AXfbtHDSvLidu21x313bUMSlYz0HrU5xfGDFt1YgXiU/NpxTRGcL2lDiXzrFU6r6dv/9nqK2zOZjAXNQS32CryNcf+z7xIivK5Pc+52MyX5pYCjeV70wY+fy1kf/PvY2e5QybgS9pFij0qpZmEqMnnEZIQtPTRyIAgt6LyExVrDZplOM559JxQteR8oOqz7LOxlmzxuhe2uPvnDpmKxl4Q9S8sgN8yXZ+V6UGnWI9MlhMjDtKbW2XpUcSZ0JfkgNkQBFXFxHzaGZB56++eOPDfAzte3YBY840j8CD3M7JaxxSFWBgFct2Ug==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713937643; bh=vN2ARhfPf/eKgJRPoCqeqV6uHqqiFkCUidDwyr+D4E3=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=nMhWi9m4wlXS9bUuN8Kec7eKjbBWTiR1i5nckVApbINmATftbtKVtt6ubvnwTf5qg8fjH4FehEJ4WAtRNZHA3oED/4Kju0jlUUPWeEdzuo8W06ERwZNJi+6iM1tVFM5wtGPMIhIus9S9UxPC1gCJUWwl7wteOQSM36dFYUhz1OYqAqxQ+zYAqr5hdGS3tG/rT3laeYFzjoFIrHJnM0Wk7+PlBDBu4o3Vx6O/wrTFb4GFhx6RYl8Xl1iZR5lfAp76mCGFFtnU6cwt7ePvUUsv1jTKxyT6sui7IKxJGa5Um9i4VynyRMlMRtB7aP+626VY8ojZ+59MQvQFgOaWYb9SnQ==
X-YMail-OSG: IO0v64QVM1lzExpb8aUBFD_HswTlpCS_rA8VGm8eq_eIGGRWcIa_FHG69bYJIML
 snrvs3skQtyQhMDJLunM9baDRri9DRacEBuQVQ7gDjCuQZ8rtgWh.Rm58U0Z3oBK0rFH16.zmvlC
 Q5KaUN9E__Q6Mu2_.0Tn_JFdS0Sxc10QkXUJJtNZvkI9.yK7T4zndMEAt2kAgVNfsAnMsJl3I9kq
 Aj5GCouNFUFpc74dROtUhbifgQKVzD3hvv2sclQL45xMxwIBpN_U9BFRk2ruEcxROyzr9qbsdskY
 oTvTpfZGpXOahPOhWrN0PJLMtMM5ZdaIdgK.qtNYtSsW_UwC3drPtnYsJigb5L6NVFWcNqGvKsUk
 21jaSvl7.E08uFFLp5dwOZov92sg.IdXDfx7jKju90ggTNMozumCB.kkqjSphBVD1lDvpz0d2sEE
 jOizZzYvoPOVaVgGifkbA9oS2JbW962lev80YcKZqWvPx1CdizdLhKpyU92O4VDixCFgmkrKgsC5
 qHsnVntP14SU9Y896W9baC4LAyf5Qj5k9TfflASCVRB0vQ4EOae7KanqvWWViOPtttBI.GcwSzH0
 BNvMJDjnGHoz6oi43uCjpr_866RXUtxiUxFmOOEk7a1OIzZfn9MdHk6QZW5Ty8TAPiX91mtKPPjT
 PEMequ.zZW4cRIg1tcQe8OwkbUS.DeQovxfUCY65ksj7hgLR2VORZnU5fLdWzFElC55ayhUJsFtd
 LPYlit4R36Pk5gFs1gPfOL0zRCTVR78lHKu0SXDVcvv3pb_tlybyms4HqTevTjEad8yXrMI4sWwO
 1mnB3lXQEMDGjbssM8TuBLNWpntQCH_4X20cIi8mNWxyUe_vCtti63Grmbn1jhjzyf2rk7VUzm7x
 CVqkcnflUY9xh.KSO1V3B_F7mgz3LzGXz460lcOex_PuKIe_61OIrH3uTygVRrQpg.Tm.SHr2UyC
 3R4T2LlKI_d2EAEnchZ7_IcJdPYBVm0ibPULsgelR.CuYGsAq.b2b44JjpDHo2vcYk3bCd3bXN3X
 PY6.P23_9tPfeWXaCVsnrED7BFy0V5U7NSaJz7Dm9SVE48Xg_JxgHr8O0nWxmUL2EcFCo1Im7XFJ
 yY62kXMmoU1DAa6FIjyPMtuhbpylKedD7TFT.0Bz4U4uCioqPRUgFKyDL3PkhaaIuxruoiBRjA4W
 dW4bQaqTq.8ygQS6iflXZbSM8sYSFmn8cK979P_FGpQnwDNXpuedOD40fZmkDsOUYw5oRvobl2UP
 du23c_pUkwmwShnd75GnfNY8uIw3MVjL7_1X0VcMwUMv44QXap7M7Oj6D7b3a44sbAw3KGm3CGcw
 XC38.vYiYAamUfgkCPe_C4r7r22xYMNjF06xC9V9Ge3gmAXxoGOJpXaeiq2VT3QqnAsiJJo9VzEX
 pkrm.63NFqnmKMiAQok0_Bf5YPueeOnfAqhLaRuu29Yq.n7ZHws9ujFd1ldp4.dPYrwmyLnwptN7
 rSIzeUrUsHz61aObkxcBJoKG9rzgJn1u3FrDIi5GS9ts4DU6R7OrYmIUwrjGMT9Aszk1Vmu9WdDW
 wBPHwHd.TFS6RqYTpwC8H0nKby760SGc12FjWvXN2arunc9adJVI6cV7UGBuXgSorOV83TDtHDE0
 G41LGZj4QlcR_XbqA3A9Yvza.2QCJ36VNUJUC2wyXkiksknw6zbSvEz8eAJieVQMPWVxuiYvcbPy
 UzSBnwgnlxFOky6GkdLxOjIVKze6oPu2U4SmZYPEywBup4OFYzlezR1bUqfj75wqnobwgvtVFhFn
 IGzty8vic.p6r9IkBHLhIebwtZL67R0n4SyLOGuycY33Ir0pwNUuv_gRUTrIK7wd6xRqLtQZdNjo
 XcbdWcxB9SZCAVzP4f0KHCTM9XR1Y0RWv2.pxxMVTv_SoSQV.z7WErW91BnPWJIfv6BEmULyU.m6
 WBQRYIVBIbo4O.sOWpC_xkopF0H1TsJogYyh5Wplg4OnfsEVzxw2VDdDyxZhJ0XWbVRYQAYsvTu3
 ly7qgNVSi6qgqnaprhqqiCkGMI.Y8iqDs39vv_IXSsLpW5kt00Kr5wr.liiy15vF2urjOtVTG_dZ
 FL.D513j4c3JKVRDeYm7hdTwLvBH6dDx9rvCqtaPZyDqcCSFTzElgippzvmTECQ3KO.4XJs_IZji
 7Jy8ULG5Zmm3y7._7RfMVCxDzy6gpxo34bMUmKWT82E.kRmwtRy..NPxiADGZjJMWGTr7trS1Gng
 BRdT5tUcqjfMErwsJy9oseMd1L_eh3LyvahcX50N10gg9Z0vqc.zl2tjBhNKqbTUSlf.Z..9JvUe
 QP0yOfqh7MRMmmGAzMujMIXg-
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: 442cde3c-239e-443e-983a-cb172016f9d7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.sg3.yahoo.com with HTTP; Wed, 24 Apr 2024 05:47:23 +0000
Date: Wed, 24 Apr 2024 05:25:55 +0000 (UTC)
From: Prasad Pandit <pjp@fedoraproject.org>
Reply-To: Prasad Pandit <pj.pandit@yahoo.in>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <978513013.1900588.1713936355848@mail.yahoo.com>
In-Reply-To: <CAK7LNAShU0GS4e=wRupgwUDHhxMR5SVmkWn4mTZMU6r+Vng0Xg@mail.gmail.com>
References: <20240407072933.3562124-1-ppandit@redhat.com> <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com> <668901914.114470.1713335369416@mail.yahoo.com> <CAK7LNAReoYHT0-SUzFT11y=pN6GTLSgu0+7Su+2Tthkz5VFymw@mail.gmail.com> <1927988181.1604457.1713852967808@mail.yahoo.com> <CAK7LNAShU0GS4e=wRupgwUDHhxMR5SVmkWn4mTZMU6r+Vng0Xg@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: add config and source entry details
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22256 YMailNorrin

Hi,

On Tuesday, 23 April, 2024 at 03:41:35 pm IST, Masahiro Yamada <masahiroy@k=
ernel.org> wrote:=C2=A0
>EOL is a statement separator.

* Right. So are semi-colon (;), braces (}{) and colon (:) in case of C and =
Python.

=3D=3D=3D
$ cat t.c

#include <stdio.h>

int main (void)
{ printf("Hello, world!\n");$
$
$ cc -xc -o t t.c=C2=A0
t.c: In function =E2=80=98main=E2=80=99:
t.c:6:1: error: expected declaration or statement at end of input
=C2=A0 =C2=A0 6 | { printf("Hello, world!\n");
=C2=A0 =C2=A0 =C2=A0 | ^
---

$ cat t.py
#!/usr/bin/python

if (x =3D=3D 10)$
$
$ python t.py=C2=A0
=C2=A0 File "/tmp/im/t.py", line 3
=C2=A0 =C2=A0 if (x =3D=3D 10)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^
SyntaxError: expected ':'
=3D=3D=3D

* In above examples, files terminate without completing the statement and/o=
r function definition (missing closing brace '}'), which is being treated a=
s an error.


>Could you give me an example programming language
>that errors out when \n is missing at the end of the
>source file?

* It is not about '\n' at the end of file, but '\n' at the end of the Kconf=
ig statement/record. Because Kconfig language uses EOL as a separator.


> I do not think requiring EOL at the end of file would help simplify the l=
exer/parser.

* It does, because on the parser side you don't have to define rule(s) with=
 EOF to parse statements.


>When the lexer is encountered with EOF, it must
>tell the parser to finish the current statement
>and go back to the previous source file.
>So, EOF implies the end of the statement anyway.

* No, EOF does not imply end of a statement. The errors reported by gcc(1) =
and Python above clearly confirm that EOF is not end of statement.

* In their case colon(':') or brace ('}') are the required terminators, whe=
reas in Kconfig's case EOL ('\n') is the required terminator.

* Because Kconfig language uses EOL ('\n') as statement separator/terminato=
r, IMHO it should display an error when that condition is not met, because =
such statement remains incomplete.


Thank you.
---
=C2=A0 -Prasad

