Return-Path: <linux-kbuild+bounces-7503-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3314ADA1F9
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 15:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1DD91890804
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 14:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11AF1A5BAE;
	Sun, 15 Jun 2025 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8k+Y3bA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F14EBA53;
	Sun, 15 Jun 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749995992; cv=none; b=aWE00Y6unx5ywZQt1UlasP2F0ZI5E+I7RFBUw9blQXAAcr6G2rpahlrksC9sWaIziqXAJ1pFFDFKdg2gTGrPk0XFfj5NEiiC874jRtK75e45RL5nQcFdL0ejiwD4uhCA5LCX3PNKxwTJNNGVzL7K8X+iKpVopcMLHeU8V3oZFC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749995992; c=relaxed/simple;
	bh=WmNsQfip4vrfN7hlnNXAYAFu5sigfQqIQkVm2jibIow=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=f8jN31XRgyFNogKXsPFB00UIHrV1hR8Two8zf+N5JnScxrKn8SPa6bt97qgfaOMbIXsx+6W/s5Xqqp9xgkFifBH/TQONA6MnRobb7RTaeuSGa+KX4ubKQXw3DeeFCjjOaJZ/RPoMWXEX9hU9H3oBumDg4NhZttI26DwkhJ21NY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8k+Y3bA; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so38443916d6.1;
        Sun, 15 Jun 2025 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749995990; x=1750600790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OnIqrqg12Nadpw9uFLKyOVdTtgRw1WyMs6J3V1XnBis=;
        b=X8k+Y3bAQQHviMbSXOVNqPKUwsuIrxuhQWrA25QP+W3+XiEWvQrVpx8UkZBz+476ok
         tD32zNx14GBvetpaVDnovsC4iaDhnZJpw6LmrjBh7tkuPkTU4Ds+iFJZJuu11L9eT+C5
         E58Bjw81CVlhLIb3qGzr1x0ZG9od6S7GIzC1aaqTy4kgv1Qq7gT9CDMSuCaXI8DBtiYc
         nQcE2qiFF+p6tMhb7uddtNptjBHYFIx/ZTvxklCQEk1S1GAJepFPZ+RtLqJzBsFW5mD0
         xaSR/uFsRJR0g5zOyXCf7djA2n3VUtUvDK1V0AxwI58NB/VwhXdlvC03d4dAbHTmb4Nx
         Es0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749995990; x=1750600790;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnIqrqg12Nadpw9uFLKyOVdTtgRw1WyMs6J3V1XnBis=;
        b=TWRvlbMwzx8nRDMxV4e26Y96JfroIs4hmslCwOSPgS+rAOVzY70tQb3HFAN2dvj5Nd
         98VlGMUuIQdfgKVCObIob7v8l3fLTCuwP1e9l98IY9vjrQ32cPm2wLA1CElsheWvbEtU
         2Aee+ohR8gsp3ZoM9lMI+ddVjwf9fzN5us/BNI1N59GbbDOD/VH/qLJ1cu6zjLovjZGY
         XaPpueZoNr/eiOJTBcEgC58olakRsKRtnT+bcXO/vx2cDfGizrNa69khrrniIVVKW+JI
         KykWL/6pmBJVkRgh9km/VMECF9jt+H2Eylj4vOXo1k8eb3vJhmYAuyg/NG3rtGgrDsUg
         RzcA==
X-Gm-Message-State: AOJu0Yx/HptcuGwqyfyA84lvExCqGqOYS9ojbYxPLkJtc7LV6kzyVFGq
	LfKdyM46/Kcjgnjg2VgsqFl+pdSH4SlsasyY/3oLsu88QU+PvCAHcJGGhYOGbi94HTwvmrEdm79
	CRN5slYT1DjjSFxmqC2yy07V8j3F39qKV7Q==
X-Gm-Gg: ASbGncsvzu8RRL1GmiH+NxWD+s0P2ycymvRD0DiFQYCUwjCmjE4I8bCzZBGKUhsbeZo
	xxdNIaBg+CC57GWTBFNNQfJctdIqYBJ6or+x9j4aPgRQGvpz+iRalBn9+jLPEdSu/L/GOTeNIoj
	9gc095LTUZd5gVWj1qq0BD2qGOVZPi07t34dpRHAXmvDwTCxMhJvPyivjdo1i41252xurbM6dkI
	aSF
X-Google-Smtp-Source: AGHT+IHwHm33jlN0eJ0HcvP3RXQJDvgo5OAHhmoaKXndIuBHT04eo4UJ+AJV22DgjSDFkAwJDLM1AaFuOpTpf2hOK7M=
X-Received: by 2002:a05:6214:570d:b0:6e8:fbb7:6760 with SMTP id
 6a1803df08f44-6fb47725d95mr90875686d6.1.1749995989917; Sun, 15 Jun 2025
 06:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Z-Script Zs <zscript.team.zs@gmail.com>
Date: Sun, 15 Jun 2025 19:29:38 +0530
X-Gm-Features: AX0GCFuwwd9pNdjUSEl7E1VKoPVNrh5-POQo9MXAqQNy4tY4XFlZgPerkxzShow
Message-ID: <CABGL3xcfdhDVt27MJCNs-2EhAnQ5EHm_W7RhE81YKhaq+j76=g@mail.gmail.com>
Subject: kconfig: include <strings.h> to fix bcmp build error on Clang
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, masahiroy@kernel.org
Content-Type: multipart/mixed; boundary="000000000000567afd06379cb1ef"

--000000000000567afd06379cb1ef
Content-Type: multipart/alternative; boundary="000000000000567afc06379cb1ed"

--000000000000567afc06379cb1ed
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch fixes a build error caused by missing <strings.h> when compiling
with Clang in strict ISO C environments such as Termux or Android.

The function 'bcmp' is used in scripts/kconfig/confdata.c, but without
including <strings.h>, the build fails under strict C99 rules due to an
implicit declaration.

I'm 12 years old and just starting to learn Linux kernel development.
This is my first patch submission. I'd be very grateful for any feedback or
corrections.

Thank you for your time and for maintaining this incredible project.

Best regards,
Abhigyan Ghosh
zscript.team.zs@gmail.com

--000000000000567afc06379cb1ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">This pat=
ch fixes a build error caused by missing &lt;strings.h&gt; when compiling=
=C2=A0</div><div dir=3D"auto">with Clang in strict ISO C environments such =
as Termux or Android.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
e function &#39;bcmp&#39; is used in scripts/kconfig/confdata.c, but withou=
t</div><div dir=3D"auto">including &lt;strings.h&gt;, the build fails under=
 strict C99 rules due to an</div><div dir=3D"auto">implicit declaration.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m 12 years old and j=
ust starting to learn Linux kernel development.=C2=A0=C2=A0</div><div dir=
=3D"auto">This is my first patch submission. I&#39;d be very grateful for a=
ny feedback or corrections.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Thank you for your time and for maintaining this incredible project.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,=C2=A0=C2=A0<=
/div><div dir=3D"auto">Abhigyan Ghosh=C2=A0=C2=A0</div><div dir=3D"auto"><a=
 href=3D"mailto:zscript.team.zs@gmail.com">zscript.team.zs@gmail.com</a></d=
iv></div>

--000000000000567afc06379cb1ed--
--000000000000567afd06379cb1ef
Content-Type: text/x-diff; charset="US-ASCII"; 
	name="0001-kconfig-include-strings.h-to-fix-bcmp-build-error-on.patch"
Content-Disposition: attachment; 
	filename="0001-kconfig-include-strings.h-to-fix-bcmp-build-error-on.patch"
Content-Transfer-Encoding: base64
Content-ID: <19773e36d0d438af17e1>
X-Attachment-Id: 19773e36d0d438af17e1

RnJvbSA4YjE3ZmY1ZmUwOTE2MDUwYTNmZTI3OWJlZmIzMDE4OTliZWY4M2IwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBYmhpZ3lhbiBHaG9zaCA8enNjcmlwdC50ZWFtLnpzQGdtYWls
LmNvbT4KRGF0ZTogU3VuLCAxNSBKdW4gMjAyNSAxODo1MToyMSArMDUzMApTdWJqZWN0OiBbUEFU
Q0hdIGtjb25maWc6IGluY2x1ZGUgPHN0cmluZ3MuaD4gdG8gZml4IGJjbXAgYnVpbGQgZXJyb3Ig
b24gQ2xhbmcKCkZpeGVzIGJ1aWxkIGZhaWx1cmUgd2hlbiBjb21waWxpbmcgd2l0aCBDbGFuZyBp
biBzdHJpY3QgQzk5IGVudmlyb25tZW50cwpzdWNoIGFzIFRlcm11eCBvciBBbmRyb2lkLCB3aGVy
ZSAnYmNtcCcgaXMgbm90IGRlY2xhcmVkIHVubGVzcwo8c3RyaW5ncy5oPiBpcyBpbmNsdWRlZC4K
ClNpZ25lZC1vZmYtYnk6IEFiaGlneWFuIEdob3NoIDx6c2NyaXB0LnRlYW0uenNAZ21haWwuY29t
PgotLS0KIHNjcmlwdHMva2NvbmZpZy9jb25mZGF0YS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9rY29u
ZmlnL2NvbmZkYXRhLmMgYi9zY3JpcHRzL2tjb25maWcvY29uZmRhdGEuYwppbmRleCBhYzk1NjYx
YTEuLjA2YTZjZDc3YyAxMDA2NDQKLS0tIGEvc2NyaXB0cy9rY29uZmlnL2NvbmZkYXRhLmMKKysr
IGIvc2NyaXB0cy9rY29uZmlnL2NvbmZkYXRhLmMKQEAgLTIsNyArMiw3IEBACiAvKgogICogQ29w
eXJpZ2h0IChDKSAyMDAyIFJvbWFuIFppcHBlbCA8emlwcGVsQGxpbnV4LW02OGsub3JnPgogICov
Ci0KKyNpbmNsdWRlIDxzdHJpbmdzLmg+CiAjaW5jbHVkZSA8c3lzL21tYW4uaD4KICNpbmNsdWRl
IDxzeXMvc3RhdC5oPgogI2luY2x1ZGUgPHN5cy90eXBlcy5oPgotLSAKMi40OS4wCgo=
--000000000000567afd06379cb1ef--

