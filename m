Return-Path: <linux-kbuild+bounces-4824-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD99D6911
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 13:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24191614B6
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 12:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1115817A583;
	Sat, 23 Nov 2024 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjSjAxWt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03379A94A
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732365882; cv=none; b=gUaC4g0DyQc8xQ6K2Qz1OR3tO1667oFVUTnwKtanQ+tEXoT8UwxbwcVohUn1z7azFnAvL2SsxyFTJQSORwyfqyGtzZm0oQ1YrvzyPyUD6ckVXKEYVStaW8WChSjfn5zycuHiAOLqKsIbDob8f6U89qCJ6FROQJGUmWOBYww47bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732365882; c=relaxed/simple;
	bh=xKZk9cM9ngT7Z1sTgvquh4qNrAHJrqFlkJzR3fJTECY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ub3KLIwskcob2qllcYzsdcpdZ1uaPfXjSNyyX+pTICzAMH6HqvZdq8PXMe76i4gzzZ1G7TvHtfYQMXcohjcCqZb+9eMt8WdJdxi+5V17OS1iT4x5havanOJYSKDxcFFtnbio3RiZ7ABcfOaHpLxPwEXdxAeuFWKM/JyBWj7dcME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjSjAxWt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so1828069e87.2
        for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732365878; x=1732970678; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HBanFeDSLKKEKQjlX9lZBVwo42N2t5bt6w990frgjY8=;
        b=WjSjAxWttsp4xg16bnmsZ55H1DGBGwdal4VXJsQKt9J1Gad5HTVi40H87SVlS8rOcq
         rn0FvOLFG7pPFkt7JuwNcqSVIsxJJFmE9OXI+VV8qmyIL9JM1WEpWlZ5yFV6Y2jOOczA
         fbUamoTBSM8uCGeCe83thu8LSFi+GMM7Oou+JHmHRg523xsmmh4gNqhcjIRSWkhtNT5A
         945z9E3IW4bZaoP7Jx68VQYOyjnY97+NjG5jFB+G0Q4JN2X4vaZjSVtUiNkD5n82NCEk
         H86GMn4kE6DqFGhEZ4sqDS2QuA+KdQBKQSrE0IVVHf2lRVXIph8JbTkziCGzK5kVINqw
         BHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732365878; x=1732970678;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBanFeDSLKKEKQjlX9lZBVwo42N2t5bt6w990frgjY8=;
        b=ZI08paSWxnkZW4QFpX5T07t+ExEIHY4EOP0iVRGh6p1apO5oaDcKrnK4Uw2t8+LVjw
         l9Cf69e8b5we/i+L5wl1dFwTf6Jg3ev1+XyS4gLS/mVSe3xWNLnH8DeSxI0/cOZ3SAVw
         Vq718d8ah+5ReWx975VVBnvk5T+wAsXiFtT+y/L/TdL/pfRvf9pKOVhniVbYcvTtYYQt
         Xh9QjHEGSnc6s8ej9lB5OhAcqyEgvQ9BIhEd6BKM93ekAA5XOO7y13FXtwliMTigc1gs
         HVZV3Av/7QKIaFgZ8j7q5x2U9ErmprcR/faF31BhxtG/sl0KO0oc4gBkIHJfdn3eSgPd
         YSfg==
X-Gm-Message-State: AOJu0YzSXuH+nTi/lfl1N93Y3ISSwkCdz2FdASx02bJCkQ69JbgK2WlS
	ikpsGAfjJ3NxfLBXbOL2o4DwXWlKtV/XzQstO5onT9pC8s9lmB3J9G/R6sDDw17vPw8SdDGM8EK
	MvFLF+OT1VretrsMaelGVoAh1TWQ=
X-Gm-Gg: ASbGncsvtswMUrvJR92X4gGFszVBDmfC6BveF0Y6WB81Kd77e4ioEx8vh8bd2205wbI
	Kl44FkPoL5dOkcan8bFtz+/rv440ZJct42AghpyqQlrBp0paLr99438eOOmbfnA==
X-Google-Smtp-Source: AGHT+IGpYfhkMcEIuyGPKsWTqI3fxBIOHH1g0kvaD7z0GQwHWzz/VnGhGPg1eb76SRrdAgmFVSZTbT8oFAMyjvWf8Gw=
X-Received: by 2002:a05:6512:2391:b0:53d:d5be:4bd9 with SMTP id
 2adb3069b0e04-53dd5be4bebmr3238203e87.22.1732365877663; Sat, 23 Nov 2024
 04:44:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsEkjtm4vSVKkXPTg+Q@mail.gmail.com>
In-Reply-To: <CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsEkjtm4vSVKkXPTg+Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 23 Nov 2024 13:44:00 +0100
Message-ID: <CA+icZUUjZawN2WShj2kFedANeRDLaaJuAtH=6iSTQCr7YTYROA@mail.gmail.com>
Subject: Re: kbuild-next: .tmp vmlinux syms files
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: multipart/mixed; boundary="000000000000c279cc062793dcca"

--000000000000c279cc062793dcca
Content-Type: text/plain; charset="UTF-8"

dileks@iniza:~/src/linux/git$ git grep -n -e 'kallsyms[0-9]' -e
'vmlinux[0-9]' scripts/
scripts/link-vmlinux.sh:210:    true > .tmp_vmlinux.kallsyms0.syms
scripts/link-vmlinux.sh:211:    kallsyms .tmp_vmlinux.kallsyms0.syms
.tmp_vmlinux0.kallsyms
scripts/link-vmlinux.sh:221:    vmlinux_link .tmp_vmlinux1
scripts/link-vmlinux.sh:225:    if ! gen_btf .tmp_vmlinux1; then
scripts/link-vmlinux.sh:238:    # 1)  Link .tmp_vmlinux.kallsyms1 so
it has all symbols and sections,
scripts/link-vmlinux.sh:240:    #     Running kallsyms on that gives
us .tmp_kallsyms1.o with
scripts/link-vmlinux.sh:242:    # 2)  Link .tmp_vmlinux.kallsyms2 so
it now has a __kallsyms section of
scripts/link-vmlinux.sh:245:    #     From here, we generate a correct
.tmp_vmlinux.kallsyms2.o
scripts/link-vmlinux.sh:261:    sysmap_and_kallsyms .tmp_vmlinux1
scripts/link-vmlinux.sh:264:    vmlinux_link .tmp_vmlinux2
scripts/link-vmlinux.sh:265:    sysmap_and_kallsyms .tmp_vmlinux2
scripts/link-vmlinux.sh:269:            vmlinux_link .tmp_vmlinux3
scripts/link-vmlinux.sh:270:            sysmap_and_kallsyms .tmp_vmlinux

dileks@iniza:~/src/linux/git$ LC_ALL=C ls -alth .*vmlinux* *vmlinux*
-rw-rw-r-- 1 dileks dileks  915 Nov 22 20:52 .vmlinux.cmd
-rwxrwxr-x 1 dileks dileks 283M Nov 22 20:52 vmlinux
-rw-rw-r-- 1 dileks dileks 3.1M Nov 22 20:52 .tmp_vmlinux2.kallsyms.o
-rw-rw-r-- 1 dileks dileks  34M Nov 22 20:52 .tmp_vmlinux2.kallsyms.S
-rw-rw-r-- 1 dileks dileks 6.5M Nov 22 20:52 .tmp_vmlinux2.syms
-rwxrwxr-x 1 dileks dileks 101M Nov 22 20:52 .tmp_vmlinux2
-rw-rw-r-- 1 dileks dileks 3.1M Nov 22 20:52 .tmp_vmlinux1.kallsyms.o
-rw-rw-r-- 1 dileks dileks  34M Nov 22 20:52 .tmp_vmlinux1.kallsyms.S
-rw-rw-r-- 1 dileks dileks 6.5M Nov 22 20:52 .tmp_vmlinux1.syms
-rwxrwxr-x 1 dileks dileks  52M Nov 22 20:52 .tmp_vmlinux1.btf.o
-rwxrwxr-x 1 dileks dileks 514M Nov 22 20:52 .tmp_vmlinux1
-rw-rw-r-- 1 dileks dileks 2.1K Nov 22 20:51 .tmp_vmlinux0.kallsyms.o
-rw-rw-r-- 1 dileks dileks 6.3K Nov 22 20:51 .tmp_vmlinux0.kallsyms.S
-rw-rw-r-- 1 dileks dileks    0 Nov 22 20:51 .tmp_vmlinux.kallsyms0.syms
-rw-rw-r-- 1 dileks dileks 5.3K Nov 22 20:51 ..vmlinux.export.o.cmd
-rw-rw-r-- 1 dileks dileks 6.6M Nov 22 20:51 .vmlinux.export.o
-rw-rw-r-- 1 dileks dileks 1.1M Nov 22 20:51 .vmlinux.export.c
-rw-rw-r-- 1 dileks dileks  139 Nov 22 20:47 ..vmlinux.objs.cmd
-rw-rw-r-- 1 dileks dileks  61K Nov 22 20:47 .vmlinux.objs
-rw-rw-r-- 1 dileks dileks  391 Nov 22 20:47 .vmlinux.o.cmd
-rw-rw-r-- 1 dileks dileks 511M Nov 22 20:47 vmlinux.o
-rw-rw-r-- 1 dileks dileks  292 Nov 22 20:47 .vmlinux.a.cmd
-rw-rw-r-- 1 dileks dileks 2.6M Nov 22 20:47 vmlinux.a

$ grep 'kallsyms .tmp'
~/src/linux/archives/6.12.1-1-amd64-clang19-kcfi/build-log_6.12.1-1-amd64-clang19-kcfi.txt
94662:+ kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
94734:+ sysmap_and_kallsyms .tmp_vmlinux1
94741:+ kallsyms .tmp_vmlinux1.syms .tmp_vmlinux1.kallsyms
94795:+ sysmap_and_kallsyms .tmp_vmlinux2
94802:+ kallsyms .tmp_vmlinux2.syms .tmp_vmlinux2.kallsyms

Something like that would make more sense:

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 53bd4b727e21..9e59849f457a 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -207,8 +207,8 @@ kallsymso=
strip_debug=

if is_enabled CONFIG_KALLSYMS; then
-       true > .tmp_vmlinux.kallsyms0.syms
-       kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
+       true > .tmp_vmlinux0.kallsyms.syms
+       kallsyms .tmp_vmlinux0.kallsyms.syms .tmp_vmlinux0.kallsyms
fi

if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
@@ -235,14 +235,14 @@ if is_enabled CONFIG_KALLSYMS; then
       # Generate section listing all symbols and add it into vmlinux
       # It's a four step process:
       # 0)  Generate a dummy __kallsyms with empty symbol list.
-       # 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and sections,
+       # 1)  Link .tmp_vmlinux1.kallsyms so it has all symbols and sections,
       #     with a dummy __kallsyms.
-       #     Running kallsyms on that gives us .tmp_kallsyms1.o with
+       #     Running kallsyms on that gives us .tmp_vmlinux1.kallsyms.o with
       #     the right size
-       # 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms section of
+       # 2)  Link .tmp_vmlinux2.kallsyms so it now has a __kallsyms section of
       #     the right size, but due to the added section, some
       #     addresses have shifted.
-       #     From here, we generate a correct .tmp_vmlinux.kallsyms2.o
+       #     From here, we generate a correct .tmp_vmlinux2.kallsyms.o
       # 3)  That link may have expanded the kernel image enough that
       #     more linker branch stubs / trampolines had to be added, which
       #     introduces new names, which further expands kallsyms. Do another

Added as a diff file - when GMail truncates above.

BR,
-Sedat-

P.S.: After diff run...

$ git grep -n -e 'kallsyms[0-9]' -e 'vmlinux[0-9]' scripts/
scripts/link-vmlinux.sh:210:    true > .tmp_vmlinux0.kallsyms.syms
scripts/link-vmlinux.sh:211:    kallsyms .tmp_vmlinux0.kallsyms.syms
.tmp_vmlinux0.kallsyms
scripts/link-vmlinux.sh:221:    vmlinux_link .tmp_vmlinux1
scripts/link-vmlinux.sh:225:    if ! gen_btf .tmp_vmlinux1; then
scripts/link-vmlinux.sh:238:    # 1)  Link .tmp_vmlinux1.kallsyms so
it has all symbols and sections,
scripts/link-vmlinux.sh:240:    #     Running kallsyms on that gives
us .tmp_vmlinux1.kallsyms.o with
scripts/link-vmlinux.sh:242:    # 2)  Link .tmp_vmlinux2.kallsyms so
it now has a __kallsyms section of
scripts/link-vmlinux.sh:245:    #     From here, we generate a correct
.tmp_vmlinux2.kallsyms.o
scripts/link-vmlinux.sh:261:    sysmap_and_kallsyms .tmp_vmlinux1
scripts/link-vmlinux.sh:264:    vmlinux_link .tmp_vmlinux2
scripts/link-vmlinux.sh:265:    sysmap_and_kallsyms .tmp_vmlinux2
scripts/link-vmlinux.sh:269:            vmlinux_link .tmp_vmlinux3
scripts/link-vmlinux.sh:270:            sysmap_and_kallsyms .tmp_vmlinux3

--000000000000c279cc062793dcca
Content-Type: text/x-patch; charset="US-ASCII"; name="link-vmlinux_sh.diff"
Content-Disposition: attachment; filename="link-vmlinux_sh.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m3u5txb00>
X-Attachment-Id: f_m3u5txb00

ZGlmZiAtLWdpdCBhL3NjcmlwdHMvbGluay12bWxpbnV4LnNoIGIvc2NyaXB0cy9saW5rLXZtbGlu
dXguc2gKaW5kZXggNTNiZDRiNzI3ZTIxLi45ZTU5ODQ5ZjQ1N2EgMTAwNzU1Ci0tLSBhL3Njcmlw
dHMvbGluay12bWxpbnV4LnNoCisrKyBiL3NjcmlwdHMvbGluay12bWxpbnV4LnNoCkBAIC0yMDcs
OCArMjA3LDggQEAga2FsbHN5bXNvPQogc3RyaXBfZGVidWc9CiAKIGlmIGlzX2VuYWJsZWQgQ09O
RklHX0tBTExTWU1TOyB0aGVuCi0JdHJ1ZSA+IC50bXBfdm1saW51eC5rYWxsc3ltczAuc3ltcwot
CWthbGxzeW1zIC50bXBfdm1saW51eC5rYWxsc3ltczAuc3ltcyAudG1wX3ZtbGludXgwLmthbGxz
eW1zCisJdHJ1ZSA+IC50bXBfdm1saW51eDAua2FsbHN5bXMuc3ltcworCWthbGxzeW1zIC50bXBf
dm1saW51eDAua2FsbHN5bXMuc3ltcyAudG1wX3ZtbGludXgwLmthbGxzeW1zCiBmaQogCiBpZiBp
c19lbmFibGVkIENPTkZJR19LQUxMU1lNUyB8fCBpc19lbmFibGVkIENPTkZJR19ERUJVR19JTkZP
X0JURjsgdGhlbgpAQCAtMjM1LDE0ICsyMzUsMTQgQEAgaWYgaXNfZW5hYmxlZCBDT05GSUdfS0FM
TFNZTVM7IHRoZW4KIAkjIEdlbmVyYXRlIHNlY3Rpb24gbGlzdGluZyBhbGwgc3ltYm9scyBhbmQg
YWRkIGl0IGludG8gdm1saW51eAogCSMgSXQncyBhIGZvdXIgc3RlcCBwcm9jZXNzOgogCSMgMCkg
IEdlbmVyYXRlIGEgZHVtbXkgX19rYWxsc3ltcyB3aXRoIGVtcHR5IHN5bWJvbCBsaXN0LgotCSMg
MSkgIExpbmsgLnRtcF92bWxpbnV4LmthbGxzeW1zMSBzbyBpdCBoYXMgYWxsIHN5bWJvbHMgYW5k
IHNlY3Rpb25zLAorCSMgMSkgIExpbmsgLnRtcF92bWxpbnV4MS5rYWxsc3ltcyBzbyBpdCBoYXMg
YWxsIHN5bWJvbHMgYW5kIHNlY3Rpb25zLAogCSMgICAgIHdpdGggYSBkdW1teSBfX2thbGxzeW1z
LgotCSMgICAgIFJ1bm5pbmcga2FsbHN5bXMgb24gdGhhdCBnaXZlcyB1cyAudG1wX2thbGxzeW1z
MS5vIHdpdGgKKwkjICAgICBSdW5uaW5nIGthbGxzeW1zIG9uIHRoYXQgZ2l2ZXMgdXMgLnRtcF92
bWxpbnV4MS5rYWxsc3ltcy5vIHdpdGgKIAkjICAgICB0aGUgcmlnaHQgc2l6ZQotCSMgMikgIExp
bmsgLnRtcF92bWxpbnV4LmthbGxzeW1zMiBzbyBpdCBub3cgaGFzIGEgX19rYWxsc3ltcyBzZWN0
aW9uIG9mCisJIyAyKSAgTGluayAudG1wX3ZtbGludXgyLmthbGxzeW1zIHNvIGl0IG5vdyBoYXMg
YSBfX2thbGxzeW1zIHNlY3Rpb24gb2YKIAkjICAgICB0aGUgcmlnaHQgc2l6ZSwgYnV0IGR1ZSB0
byB0aGUgYWRkZWQgc2VjdGlvbiwgc29tZQogCSMgICAgIGFkZHJlc3NlcyBoYXZlIHNoaWZ0ZWQu
Ci0JIyAgICAgRnJvbSBoZXJlLCB3ZSBnZW5lcmF0ZSBhIGNvcnJlY3QgLnRtcF92bWxpbnV4Lmth
bGxzeW1zMi5vCisJIyAgICAgRnJvbSBoZXJlLCB3ZSBnZW5lcmF0ZSBhIGNvcnJlY3QgLnRtcF92
bWxpbnV4Mi5rYWxsc3ltcy5vCiAJIyAzKSAgVGhhdCBsaW5rIG1heSBoYXZlIGV4cGFuZGVkIHRo
ZSBrZXJuZWwgaW1hZ2UgZW5vdWdoIHRoYXQKIAkjICAgICBtb3JlIGxpbmtlciBicmFuY2ggc3R1
YnMgLyB0cmFtcG9saW5lcyBoYWQgdG8gYmUgYWRkZWQsIHdoaWNoCiAJIyAgICAgaW50cm9kdWNl
cyBuZXcgbmFtZXMsIHdoaWNoIGZ1cnRoZXIgZXhwYW5kcyBrYWxsc3ltcy4gRG8gYW5vdGhlcgo=
--000000000000c279cc062793dcca--

