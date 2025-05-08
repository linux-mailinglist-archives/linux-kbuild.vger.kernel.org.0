Return-Path: <linux-kbuild+bounces-7039-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C39AAFF68
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 17:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB4D14A7B7C
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 15:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FA1279785;
	Thu,  8 May 2025 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zm7vS+iy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BDAEACE;
	Thu,  8 May 2025 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718997; cv=none; b=dMp1S59YtpP8H2hT9VVtENopovxc/2Z9PaRnZLgCy8b+i9TiQo/99kPYqt96G9BG2RAQ+NY3GyuYV3S00agH2Fi54wF2qD7VzIX83+IqPX3EyqafRoM1oIEvmE7M/bfCmzAUzWjzhvfZcKIe0JZhoU8S64+y+z4TNwjjAsT1Hc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718997; c=relaxed/simple;
	bh=8dzT9t3cVq9uoCuSIQ90NVeEcbBB9+by5+ie8IMugQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ln5wHt0pmC4DDWLh+bHRWkW9L/PJJsCOvhwoGEiCRcrgec4WOLPNYsZtTId/GXVRkK9f6A4fi6UDKdCfEInyd6175my3SzO8eP9MtjTTWeL0c0HksiX8/ef9pYSCWTVHkuDOblT3J16w/U0UNB/0aC0OQM3Kbh4jE5Quqv+vCHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zm7vS+iy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DE1C4CEE7;
	Thu,  8 May 2025 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746718997;
	bh=8dzT9t3cVq9uoCuSIQ90NVeEcbBB9+by5+ie8IMugQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zm7vS+iyGUjtuMhrIIMoGMOy8ZH/dco8HscodTM5iaJHXjUEFwiL7QmiUDjiKu4av
	 DJLPpxJ7QMZk1LiFxYpj0jsbzItKGw175pbmFlwf0vwIYDN3VClObTH8vUhuzFDdYM
	 9we0p756dfothH8b/jLpcmpTTVeZjGlMGbPwXsNqIM5mfg+DVPaIaKB2SKJBDjFfFz
	 yNR0uv87S26b8RbhT5XfPxZQZu9JQteNpGrIxvjLEZzyJ6isQEu5KaFvq3+UjsdDrM
	 Auluf6nHmuovJIwO18OIh7WsA/x2efocBn8C2xRlSExu8y5rv/PDvbCIWGqsMYqliP
	 iMlZPElawSAyg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e8e5d2cf0so353280e87.2;
        Thu, 08 May 2025 08:43:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcwXsFl4UPUHYFDUFMZsXWrBD27JRr7HRjoOON/GodURcaW/qrkP5niPK5Uh84Hq3p+BGD1fBdt9M+7Ao=@vger.kernel.org, AJvYcCUrqrPGbiYFPYLtljHWyBpAHxq6C6WISDoUKQiFUjeLMevbgb6boAOBmR3P6gx0xYWQJSsm6uEDUGAY94DH/w==@vger.kernel.org, AJvYcCVic/vG+PhMRzroa2Dv8RRNbRQA59lWjdS9rNm6nziePWhqxE/sw6aDySBwgxJZ1tpus4E4nH/OqbxRBxky@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3qIibiC9HZsdmFukxkwNM+CqZoB1sHUQEiA11A+0ZYc3zWqG9
	2x1ljxRJv7A9v97P84oPDB67DxBkI4OF5tAdBSq0yVEacIFu/BjIKhbkc2+/LQSp7HY7YFtwBiR
	c99Cb6/xGee4/830Sz1hI929xEWU=
X-Google-Smtp-Source: AGHT+IHXPDlkKTVZsliqMRiUEIj6GXUnprks7pBvqNumLiMMlV8tS9d0Wtj0K810wh9q93R0tGlAj8OhA2xgxdLBCeo=
X-Received: by 2002:a05:6512:6312:b0:54f:c57d:d52 with SMTP id
 2adb3069b0e04-54fc57d1068mr290248e87.53.1746718996032; Thu, 08 May 2025
 08:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <efd64a6f-d6e5-4790-96b6-0776cd3a7f5a@suse.com> <20250505093830.25688-1-legion@kernel.org>
In-Reply-To: <20250505093830.25688-1-legion@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 9 May 2025 00:42:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARzreJXDX6X_L2iTfb86pKgk7jkFrAp-8UdktZm7BqObg@mail.gmail.com>
X-Gm-Features: ATxdqUHtZwsNu7DYGBednPNaFe6cUsZ-BkNU4fcNRiLkOWnrzj0BkgeIiM396kk
Message-ID: <CAK7LNARzreJXDX6X_L2iTfb86pKgk7jkFrAp-8UdktZm7BqObg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] modpost: Create modalias for builtin modules
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000048174e0634a1b5b9"

--00000000000048174e0634a1b5b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 6:39=E2=80=AFPM Alexey Gladkov <legion@kernel.org> w=
rote:
>
> For some modules, modalias is generated using the modpost utility and
> the section is added to the module file.
>
> When a module is added inside vmlinux, modpost does not generate
> modalias for such modules and the information is lost.
>
> As a result kmod (which uses modules.builtin.modinfo in userspace)
> cannot determine that modalias is handled by a builtin kernel module.
>
> $ cat /sys/devices/pci0000:00/0000:00:14.0/modalias
> pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
>
> $ modinfo xhci_pci
> name:           xhci_pci
> filename:       (builtin)
> license:        GPL
> file:           drivers/usb/host/xhci-pci
> description:    xHCI PCI Host Controller Driver
>
> Missing modalias "pci:v*d*sv*sd*bc0Csc03i30*" which will be generated by
> modpost if the module is built separately.
>
> To fix this it is necessary to generate the same modalias for vmlinux as
> for the individual modules. Fortunately '.vmlinux.export.o' is already
> generated from which '.modinfo' can be extracted in the same way as for
> vmlinux.o.
>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>
> v2: As Petr Pavlu suggested, I separated the builtin modules from the ext=
ernal
>     modules. I've also added a search for duplicate modules.
>



> ---
>  include/linux/module.h   |  4 ----
>  scripts/mod/file2alias.c |  5 +++++
>  scripts/mod/modpost.c    | 35 +++++++++++++++++++++++++++--------
>  scripts/mod/modpost.h    | 15 ++++++++++++++-
>  4 files changed, 46 insertions(+), 13 deletions(-)


I can implement this with less code change.

I attached my patch.






--=20
Best Regards
Masahiro Yamada

--00000000000048174e0634a1b5b9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Another-simple-implementation.patch"
Content-Disposition: attachment; 
	filename="0001-Another-simple-implementation.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mafj37ap0>
X-Attachment-Id: f_mafj37ap0

RnJvbSAyOGI4NDMxZGI2OTZiMTVhNTgxMmQ2Y2EwYTczNzJhMzBlMDYwY2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBGcmksIDkgTWF5IDIwMjUgMDA6MjI6NDYgKzA5MDAKU3ViamVjdDogW1BBVENIXSBB
bm90aGVyIHNpbXBsZSBpbXBsZW1lbnRhdGlvbgoKU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFt
YWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KLS0tCiBpbmNsdWRlL2xpbnV4L21vZHVsZS5oICAg
fCAgNCAtLS0tCiBzY3JpcHRzL21vZC9maWxlMmFsaWFzLmMgfCAxNiArKysrKysrKysrKysrKysr
CiBzY3JpcHRzL21vZC9tb2Rwb3N0LmMgICAgfCAxNCArKysrKysrKysrKysrLQogc2NyaXB0cy9t
b2QvbW9kcG9zdC5oICAgIHwgIDIgKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21vZHVsZS5oIGIv
aW5jbHVkZS9saW51eC9tb2R1bGUuaAppbmRleCAwMWZjZWNhNDdhNWIuLjE3ZTY5ZTRhMTgwMiAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tb2R1bGUuaAorKysgYi9pbmNsdWRlL2xpbnV4L21v
ZHVsZS5oCkBAIC0yNTksMTQgKzI1OSwxMCBAQCBzdHJ1Y3QgbW9kdWxlX2tvYmplY3QgKmxvb2t1
cF9vcl9jcmVhdGVfbW9kdWxlX2tvYmplY3QoY29uc3QgY2hhciAqbmFtZSk7CiAJX19QQVNURSh0
eXBlLAkJCVwKIAlfX1BBU1RFKF9fLCBuYW1lKSkpKSkpKQogCi0jaWZkZWYgTU9EVUxFCiAvKiBD
cmVhdGVzIGFuIGFsaWFzIHNvIGZpbGUyYWxpYXMuYyBjYW4gZmluZCBkZXZpY2UgdGFibGUuICov
CiAjZGVmaW5lIE1PRFVMRV9ERVZJQ0VfVEFCTEUodHlwZSwgbmFtZSkJCQlcCiBleHRlcm4gdHlw
ZW9mKG5hbWUpIF9fbW9kX2RldmljZV90YWJsZSh0eXBlLCBuYW1lKQlcCiAgIF9fYXR0cmlidXRl
X18gKCh1bnVzZWQsIGFsaWFzKF9fc3RyaW5naWZ5KG5hbWUpKSkpCi0jZWxzZSAgLyogIU1PRFVM
RSAqLwotI2RlZmluZSBNT0RVTEVfREVWSUNFX1RBQkxFKHR5cGUsIG5hbWUpCi0jZW5kaWYKIAog
LyogVmVyc2lvbiBvZiBmb3JtIFs8ZXBvY2g+Ol08dmVyc2lvbj5bLTxleHRyYS12ZXJzaW9uPl0u
CiAgKiBPciBmb3IgQ1ZTL1JDUyBJRCB2ZXJzaW9uLCBldmVyeXRoaW5nIGJ1dCB0aGUgbnVtYmVy
IGlzIHN0cmlwcGVkLgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jIGIvc2Ny
aXB0cy9tb2QvZmlsZTJhbGlhcy5jCmluZGV4IGRmZjE3OTlhNGM3OS4uZDQyZjJjNzQyZmQ2IDEw
MDY0NAotLS0gYS9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMKKysrIGIvc2NyaXB0cy9tb2QvZmls
ZTJhbGlhcy5jCkBAIC0xNTI3LDUgKzE1MjcsMjEgQEAgdm9pZCBoYW5kbGVfbW9kZGV2dGFibGUo
c3RydWN0IG1vZHVsZSAqbW9kLCBzdHJ1Y3QgZWxmX2luZm8gKmluZm8sCiAJCX0KIAl9CiAKKwlp
ZiAobW9kLT5pc192bWxpbnV4KSB7CisJCXN0cnVjdCBtb2R1bGVfYWxpYXMgKmFsaWFzOworCisJ
CS8qCisJCSAqIElmIHRoaXMgaXMgdm1saW51eCwgcmVjb3JkIHRoZSBuYW1lIG9mIHRoZSBidWls
dGluIG1vZHVsZS4KKwkJICogVHJhdmVyc2UgdGhlIGxpbmtlZCBsaXN0IGluIHRoZSByZXZlcnNl
IG9yZGVyLCBhbmQgc2V0IHRoZQorCQkgKiBidWlsdGluX21vZG5hbWUgdW5sZXNzIGl0IGhhcyBh
bHJlYWR5IGJlZW4gc2V0IGluIHRoZQorCQkgKiBwcmV2aW91cyBjYWxsLgorCQkgKi8KKwkJbGlz
dF9mb3JfZWFjaF9lbnRyeV9yZXZlcnNlKGFsaWFzLCAmbW9kLT5hbGlhc2VzLCBub2RlKSB7CisJ
CQlpZiAoYWxpYXMtPmJ1aWx0aW5fbW9kbmFtZSkKKwkJCQlicmVhazsKKwkJCWFsaWFzLT5idWls
dGluX21vZG5hbWUgPSB4c3RybmR1cChtb2RuYW1lLCBtb2RuYW1lbGVuKTsKKwkJfQorCX0KKwog
CWZyZWUoemVyb3MpOwogfQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvbW9kcG9zdC5jIGIvc2Ny
aXB0cy9tb2QvbW9kcG9zdC5jCmluZGV4IGJlODk5MjFkNjBiNi4uMjg1YjZjMjBjNzYwIDEwMDY0
NAotLS0gYS9zY3JpcHRzL21vZC9tb2Rwb3N0LmMKKysrIGIvc2NyaXB0cy9tb2QvbW9kcG9zdC5j
CkBAIC0yMDIxLDExICsyMDIxLDIzIEBAIHN0YXRpYyB2b2lkIHdyaXRlX2lmX2NoYW5nZWQoc3Ry
dWN0IGJ1ZmZlciAqYiwgY29uc3QgY2hhciAqZm5hbWUpCiBzdGF0aWMgdm9pZCB3cml0ZV92bWxp
bnV4X2V4cG9ydF9jX2ZpbGUoc3RydWN0IG1vZHVsZSAqbW9kKQogewogCXN0cnVjdCBidWZmZXIg
YnVmID0geyB9OworCXN0cnVjdCBtb2R1bGVfYWxpYXMgKmFsaWFzLCAqbmV4dDsKIAogCWJ1Zl9w
cmludGYoJmJ1ZiwKLQkJICAgIiNpbmNsdWRlIDxsaW51eC9leHBvcnQtaW50ZXJuYWwuaD5cbiIp
OworCQkgICAiI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC1pbnRlcm5hbC5oPlxuIgorCQkgICAiI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPlxuIik7CiAKIAlhZGRfZXhwb3J0ZWRfc3ltYm9scygmYnVm
LCBtb2QpOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGFsaWFzLCBuZXh0LCAmbW9kLT5h
bGlhc2VzLCBub2RlKSB7CisJCWJ1Zl9wcmludGYoJmJ1ZiwgIk1PRFVMRV9BTElBU19NT0ROQU1F
KFwiJXNcIiwgXCIlc1wiKTtcbiIsCisJCQkgICBhbGlhcy0+YnVpbHRpbl9tb2RuYW1lLCBhbGlh
cy0+c3RyKTsKKwkJbGlzdF9kZWwoJmFsaWFzLT5ub2RlKTsKKwkJcHJpbnRmKCJidWlsdGluIG1v
ZG5hbWUgPSAlc1xuIiwgYWxpYXMtPmJ1aWx0aW5fbW9kbmFtZSk7CisJCWZyZWUoYWxpYXMtPmJ1
aWx0aW5fbW9kbmFtZSk7CisJCWZyZWUoYWxpYXMpOworCX0KKwogCXdyaXRlX2lmX2NoYW5nZWQo
JmJ1ZiwgIi52bWxpbnV4LmV4cG9ydC5jIik7CiAJZnJlZShidWYucCk7CiB9CmRpZmYgLS1naXQg
YS9zY3JpcHRzL21vZC9tb2Rwb3N0LmggYi9zY3JpcHRzL21vZC9tb2Rwb3N0LmgKaW5kZXggOTEz
M2U0YzM4MDNmLi4yYWVjYjhmMjVjODcgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvbW9kL21vZHBvc3Qu
aAorKysgYi9zY3JpcHRzL21vZC9tb2Rwb3N0LmgKQEAgLTk5LDEwICs5OSwxMiBAQCBidWZfd3Jp
dGUoc3RydWN0IGJ1ZmZlciAqYnVmLCBjb25zdCBjaGFyICpzLCBpbnQgbGVuKTsKICAqIHN0cnVj
dCBtb2R1bGVfYWxpYXMgLSBhdXRvLWdlbmVyYXRlZCBNT0RVTEVfQUxJQVMoKQogICoKICAqIEBu
b2RlOiBsaW5rZWQgdG8gbW9kdWxlOjphbGlhc2VzCisgKiBAbW9kbmFtZTogbmFtZSBvZiB0aGUg
YnVpbHRpbiBtb2R1bGUgKG9ubHkgZm9yIHZtbGludXgpCiAgKiBAc3RyOiBhIHN0cmluZyBmb3Ig
TU9EVUxFX0FMSUFTKCkKICAqLwogc3RydWN0IG1vZHVsZV9hbGlhcyB7CiAJc3RydWN0IGxpc3Rf
aGVhZCBub2RlOworCWNoYXIgKmJ1aWx0aW5fbW9kbmFtZTsKIAljaGFyIHN0cltdOwogfTsKIAot
LSAKMi40My4wCgo=
--00000000000048174e0634a1b5b9--

