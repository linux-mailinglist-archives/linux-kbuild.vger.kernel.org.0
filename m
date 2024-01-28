Return-Path: <linux-kbuild+bounces-699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6B83F611
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 16:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84EAC1C21E9E
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 15:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081B41E51F;
	Sun, 28 Jan 2024 15:10:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EA123769
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706454652; cv=none; b=Iij1rit9pNFy1jzQzCZmPzp59cMSeKqMlsQYkhPBGTe6DzA/QhEyIJ5srg/2qK64CeGFViV0MLnLu5+GrSrKtM0EiIBCQGWQzFumEPwbJT5rb3Q6hyzcgeckv+Gqn9gUnYp44HmQJYEYxSxL8stVAVQet8ubRgLcdQnpNBZ3WlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706454652; c=relaxed/simple;
	bh=mKlyFNIY6rTw5AYDDJcOLJqP4SToGodLyoEEE8xBr0g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=aff0y/Dx+adKeewBpGwrA9jYMAPBk/+5lAbjnq+fgnQJhBrOiaRNFeeeIMSyOAQoVc+ooY1uwssJ+Jot2DETf2pdUxzzsdopOOaB+HX3wIt9GtYMo21rfddp7johZ4K0vLqk+0zCWgeoKjwHlVLIWrSaAVm/ULhrWpznUpzcyLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sf.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sf.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1697870a12.1
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 07:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706454650; x=1707059450;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcLnVAaXT394Sf9QLpqga3m3zVMVvqVXrW3f/mAyjDo=;
        b=XobukSVtNasWe5E8NUJYoUxq8qSki7BxcfQhHi+JDm+1nSQO9QCss9w7mhuJKFhvRI
         lTPGrDWKnpJddIvp396Ngt//aecvJWApzkvEUnEsm7+0Fxk6YxVlJOadJ9Ue4I5cGCyx
         uZa0zd4apsMTsmfzmtEB+GjvHeD9T1Mlk1oeSGJZ/77IZqj126g7afhgIW5qqzbuXLbT
         7DWBMMS0nRL14sBWjiuOwv6wJJsSgk+SoG+a1cTyXvh0nBDXXGL9MX42T4/e0UrfyXTY
         u5VsBbEVFd35OYtfTRyScQhoh5uPwuZXzFvROMjSf72GATZMf7YZRtkZ46pcmos3o5Sd
         PsMw==
X-Gm-Message-State: AOJu0Ywd3EB8CdtYn0hOEYV4I/yy982ypfX9xhrYuuCSrZ+rIsCD1eFw
	tWXC1tmyyuT+AiqetAsSbgKk96fFH/0EBtlZHfhG6YTsRuNR5fpUNSdnfsfjmugMq3iu/Z/TMPx
	fo00M3lgiRSxsLrdeRKcWLa42PyVxDedUw7g=
X-Google-Smtp-Source: AGHT+IGsUOJBg+CIz65lo181ko3uMc8DfMDJalmQkOJ14raBf3JOzz2Lc0yiThW72vvWSrPVA5sP9rNRSZMmMQmS7ag=
X-Received: by 2002:a17:90b:1993:b0:28e:89cd:4fb7 with SMTP id
 mv19-20020a17090b199300b0028e89cd4fb7mr2051334pjb.22.1706454650511; Sun, 28
 Jan 2024 07:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dmitry Goncharov <dgoncharov@users.sf.net>
Date: Sun, 28 Jan 2024 10:10:39 -0500
Message-ID: <CAG+Z0CsTWFxi74PKpCkPjM_-60PsvqS7gkZKs5yrsA8OqL6Hyg@mail.gmail.com>
Subject: [v2] kbuild: Replace tabs with spaces when followed by conditionals.
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Martin Dorey <Martin.Dorey@hitachivantara.com>
Content-Type: multipart/mixed; boundary="00000000000044fd15061002ef73"

--00000000000044fd15061002ef73
Content-Type: text/plain; charset="UTF-8"

Replace tabs with spaces when followed by conditionals.

This is needed for the future (post make-4.4.1) versions of gnu make.

Starting from https://git.savannah.gnu.org/cgit/make.git/commit/?id=07fcee35f058a876447c8a021f9eb1943f902534
gnu make won't allow conditionals to follow recipe prefix.

For example there is a tab followed by ifeq on line 324 in the root Makefile.
With the new make this conditional causes the following

$ make cpu.o
/home/dgoncharov/src/linux-kbu
ild/Makefile:2063: *** missing 'endif'.  Stop.
make: *** [Makefile:240: __sub-make] Error 2

This patch replaces tabs followed by conditionals with 8 spaces.

See https://savannah.gnu.org/bugs/?64185 and
https://savannah.gnu.org/bugs/?64259 for details.


In case the mailer program messes up the tabs and spaces in the diff,
i enclosed the patch in the attachment.

Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
Reported-by: Martin Dorey <martin.dorey@hitachivantara.com>

regards, Dmitry

--00000000000044fd15061002ef73
Content-Type: text/x-patch; charset="US-ASCII"; name="tabs_and_cond.diff"
Content-Disposition: attachment; filename="tabs_and_cond.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lrxmyexs0>
X-Attachment-Id: f_lrxmyexs0

ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggOTg2OWY1N2MzZmIzLi4xMmRj
YzUxYzU4NmEgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0yOTQsMTUg
KzI5NCwxNSBAQCBtYXktc3luYy1jb25maWcJOj0gMQogc2luZ2xlLWJ1aWxkCTo9CiAKIGlmbmVx
ICgkKGZpbHRlciAkKG5vLWRvdC1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdPQUxTKSksKQot
CWlmZXEgKCQoZmlsdGVyLW91dCAkKG5vLWRvdC1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdP
QUxTKSksKQorICAgICAgICBpZmVxICgkKGZpbHRlci1vdXQgJChuby1kb3QtY29uZmlnLXRhcmdl
dHMpLCAkKE1BS0VDTURHT0FMUykpLCkKIAkJbmVlZC1jb25maWcgOj0KLQllbmRpZgorICAgICAg
ICBlbmRpZgogZW5kaWYKIAogaWZuZXEgKCQoZmlsdGVyICQobm8tc3luYy1jb25maWctdGFyZ2V0
cyksICQoTUFLRUNNREdPQUxTKSksKQotCWlmZXEgKCQoZmlsdGVyLW91dCAkKG5vLXN5bmMtY29u
ZmlnLXRhcmdldHMpLCAkKE1BS0VDTURHT0FMUykpLCkKKyAgICAgICAgaWZlcSAoJChmaWx0ZXIt
b3V0ICQobm8tc3luYy1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdPQUxTKSksKQogCQltYXkt
c3luYy1jb25maWcgOj0KLQllbmRpZgorICAgICAgICBlbmRpZgogZW5kaWYKIAogbmVlZC1jb21w
aWxlciA6PSAkKG1heS1zeW5jLWNvbmZpZykKQEAgLTMyMyw5ICszMjMsOSBAQCBlbmRpZgogIyBX
ZSBjYW5ub3QgYnVpbGQgc2luZ2xlIHRhcmdldHMgYW5kIHRoZSBvdGhlcnMgYXQgdGhlIHNhbWUg
dGltZQogaWZuZXEgKCQoZmlsdGVyICQoc2luZ2xlLXRhcmdldHMpLCAkKE1BS0VDTURHT0FMUykp
LCkKIAlzaW5nbGUtYnVpbGQgOj0gMQotCWlmbmVxICgkKGZpbHRlci1vdXQgJChzaW5nbGUtdGFy
Z2V0cyksICQoTUFLRUNNREdPQUxTKSksKQorICAgICAgICBpZm5lcSAoJChmaWx0ZXItb3V0ICQo
c2luZ2xlLXRhcmdldHMpLCAkKE1BS0VDTURHT0FMUykpLCkKIAkJbWl4ZWQtYnVpbGQgOj0gMQot
CWVuZGlmCisgICAgICAgIGVuZGlmCiBlbmRpZgogCiAjIEZvciAibWFrZSAtaiBjbGVhbiBhbGwi
LCAibWFrZSAtaiBtcnByb3BlciBkZWZjb25maWcgYWxsIiwgZXRjLgpkaWZmIC0tZ2l0IGEvYXJj
aC9tNjhrL01ha2VmaWxlIGIvYXJjaC9tNjhrL01ha2VmaWxlCmluZGV4IDQzZTM5MDQwZDNhYy4u
NzZlZjFhNjdjMzYxIDEwMDY0NAotLS0gYS9hcmNoL202OGsvTWFrZWZpbGUKKysrIGIvYXJjaC9t
NjhrL01ha2VmaWxlCkBAIC0xNSwxMCArMTUsMTAgQEAKIEtCVUlMRF9ERUZDT05GSUcgOj0gbXVs
dGlfZGVmY29uZmlnCiAKIGlmZGVmIGNyb3NzX2NvbXBpbGluZwotCWlmZXEgKCQoQ1JPU1NfQ09N
UElMRSksKQorICAgICAgICBpZmVxICgkKENST1NTX0NPTVBJTEUpLCkKIAkJQ1JPU1NfQ09NUElM
RSA6PSAkKGNhbGwgY2MtY3Jvc3MtcHJlZml4LCBcCiAJCQltNjhrLWxpbnV4LWdudS0gbTY4ay1s
aW51eC0gbTY4ay11bmtub3duLWxpbnV4LWdudS0pCi0JZW5kaWYKKyAgICAgICAgZW5kaWYKIGVu
ZGlmCiAKICMKZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL01ha2VmaWxlIGIvYXJjaC9wYXJpc2Mv
TWFrZWZpbGUKaW5kZXggOTIwZGI1N2I2YjRjLi43NDg2YjNiMzA1OTQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcGFyaXNjL01ha2VmaWxlCisrKyBiL2FyY2gvcGFyaXNjL01ha2VmaWxlCkBAIC01MCwxMiAr
NTAsMTIgQEAgZXhwb3J0IENST1NTMzJDQwogCiAjIFNldCBkZWZhdWx0IGNyb3NzIGNvbXBpbGVy
IGZvciBrZXJuZWwgYnVpbGQKIGlmZGVmIGNyb3NzX2NvbXBpbGluZwotCWlmZXEgKCQoQ1JPU1Nf
Q09NUElMRSksKQorICAgICAgICBpZmVxICgkKENST1NTX0NPTVBJTEUpLCkKIAkJQ0NfU1VGRklY
RVMgPSBsaW51eCBsaW51eC1nbnUgdW5rbm93bi1saW51eC1nbnUgc3VzZS1saW51eAogCQlDUk9T
U19DT01QSUxFIDo9ICQoY2FsbCBjYy1jcm9zcy1wcmVmaXgsIFwKIAkJCSQoZm9yZWFjaCBhLCQo
Q0NfQVJDSEVTKSwgXAogCQkJJChmb3JlYWNoIHMsJChDQ19TVUZGSVhFUyksJChhKS0kKHMpLSkp
KQotCWVuZGlmCisgICAgICAgIGVuZGlmCiBlbmRpZgogCiBpZmRlZiBDT05GSUdfRFlOQU1JQ19G
VFJBQ0UKZGlmZiAtLWdpdCBhL2FyY2gveDg2L01ha2VmaWxlIGIvYXJjaC94ODYvTWFrZWZpbGUK
aW5kZXggMWEwNjhkZTEyYTU2Li4yMjY0ZGIxNGEyNWQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L01h
a2VmaWxlCisrKyBiL2FyY2gveDg2L01ha2VmaWxlCkBAIC0xMTIsMTMgKzExMiwxMyBAQCBpZmVx
ICgkKENPTkZJR19YODZfMzIpLHkpCiAgICAgICAgICMgdGVtcG9yYXJ5IHVudGlsIHN0cmluZy5o
IGlzIGZpeGVkCiAgICAgICAgIEtCVUlMRF9DRkxBR1MgKz0gLWZmcmVlc3RhbmRpbmcKIAotCWlm
ZXEgKCQoQ09ORklHX1NUQUNLUFJPVEVDVE9SKSx5KQotCQlpZmVxICgkKENPTkZJR19TTVApLHkp
CisgICAgICAgIGlmZXEgKCQoQ09ORklHX1NUQUNLUFJPVEVDVE9SKSx5KQorICAgICAgICAgICAg
ICAgIGlmZXEgKCQoQ09ORklHX1NNUCkseSkKIAkJCUtCVUlMRF9DRkxBR1MgKz0gLW1zdGFjay1w
cm90ZWN0b3ItZ3VhcmQtcmVnPWZzIC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkLXN5bWJvbD1fX3N0
YWNrX2Noa19ndWFyZAotCQllbHNlCisgICAgICAgICAgICAgICAgZWxzZQogCQkJS0JVSUxEX0NG
TEFHUyArPSAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZD1nbG9iYWwKLQkJZW5kaWYKLQllbmRpZgor
ICAgICAgICAgICAgICAgIGVuZGlmCisgICAgICAgIGVuZGlmCiBlbHNlCiAgICAgICAgIEJJVFMg
Oj0gNjQKICAgICAgICAgVVRTX01BQ0hJTkUgOj0geDg2XzY0Cg==
--00000000000044fd15061002ef73--

