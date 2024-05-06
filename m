Return-Path: <linux-kbuild+bounces-1794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B158BD3EF
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 19:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3841C21AF9
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 17:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41383158855;
	Mon,  6 May 2024 17:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0Mxp0Bf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA05157A40
	for <linux-kbuild@vger.kernel.org>; Mon,  6 May 2024 17:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017205; cv=none; b=myk2bSEBNuOaYtpWHkJ9C2UKPDFhF8p5QzbY1OjfzTpSvTsSFF/G9kSSPfKnK+RLJ2z3ne6/BqFETd9lDskPr65MVrr0JISpOLvVOPc6C3KWQWM9Sdy32j9FMUtY6LVg7ePXFTDuPHmProE+/6JPZfyz/kjvNyliesGiHUzDBIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017205; c=relaxed/simple;
	bh=it9XXZpJTkYh0G8Z83jG4K85j3scu02x9dFoHWqJIxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vb1i5NaRKjDF8j/dHMGFr6JTF1aafthdjL2qA3stiNIIC9z7m7UxbcnO336d13ucWdDjmCkaM1HqCqWjHNwaKFOJZ7Oyt7wJbg89DK4ad0Grxv2HqBOCqkCc4OgBoNm015bDfnrCC8kdS6cchri+hlmm44MpZKfmWCIqDTi8Bhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0Mxp0Bf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A84C4DDE0
	for <linux-kbuild@vger.kernel.org>; Mon,  6 May 2024 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715017204;
	bh=it9XXZpJTkYh0G8Z83jG4K85j3scu02x9dFoHWqJIxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k0Mxp0BfaOjIkwqGb6GMjHQRIm24MHqWAVrh01toAYWVEZISYNODhVXij4Z4Jpy8t
	 YrZvLqYV0b8sapdpn2Rxxr/mtuhlgMR9DRsq7UrC3WcGX6cyQ3nlucBeCI6PNEP1xb
	 c8X6qhWjNZmZbxNmF9Ar/mI55aoR6kTCaictCjHtXYrmIRL7QXEHzqHlqDb5uil85E
	 itZH0W2Nr2+HKRNsFW+sfpJr/ZrSaxLxvOT8r9vlBYV7eCthdbRmWzvhr5UvUEHO1G
	 saEjglauTIFiIAmZ9avmxpemF5MAFOpJe7QNYdktVKwkhKbBvZe7wpdw5o5l7NPtVy
	 THZt08VRxkAIw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f300b318cso2652120e87.3
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2024 10:40:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2xc+pvFZlxKt+WzZ5zuwe2sadwyQupUl83z0+A2tES/yZdBg0RcCBKUu1Q3jSkC0OfT1QpymlPgkUPH8lbPlzrWWFnhpN9lNYILh3
X-Gm-Message-State: AOJu0YyMGrkbO+oAZIRUEjEaKR/75nsjDubiF+icjYUsif08ae4DVLwx
	bfCyEDQtm2lrxhyqdDGyYAoovHM27SfT6cRcrRN2OaUn7yySVKm72FhUGbpIPfm4KmIRmU5O8RV
	oolnvLbizUlYwlQmBb8VKVuKy1J4=
X-Google-Smtp-Source: AGHT+IF2PwSZe5BMW7UX57tkHCdRf/gekRaFtM/nnS3rN0rIH+9D9ZtSjgJTnlSF1KP0G/IduPvkC/Mwd+Y5f3i6NN4=
X-Received: by 2002:a19:8c50:0:b0:518:8d15:8810 with SMTP id
 i16-20020a198c50000000b005188d158810mr6385291lfj.14.1715017203321; Mon, 06
 May 2024 10:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422092206.147078-1-sv@linux.ibm.com> <CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com>
 <d808e90c-a27d-47c4-b7c8-55734f24981c@linux.vnet.ibm.com>
In-Reply-To: <d808e90c-a27d-47c4-b7c8-55734f24981c@linux.vnet.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 May 2024 02:39:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRqicmMs73fZgP3NJ27s8LzNi2hLLa481_Q3qJnnaDew@mail.gmail.com>
Message-ID: <CAK7LNARRqicmMs73fZgP3NJ27s8LzNi2hLLa481_Q3qJnnaDew@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] objtool: Run objtool only if either of the config
 options are selected
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, linux-kbuild@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, peterz@infradead.org, naveen.n.rao@linux.ibm.com, 
	jpoimboe@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	mahesh@linux.ibm.com, mingo@kernel.org
Content-Type: multipart/mixed; boundary="000000000000302eec0617cc8ff3"

--000000000000302eec0617cc8ff3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 1:19=E2=80=AFAM Sathvika Vasireddy
<sv@linux.vnet.ibm.com> wrote:
>
> Hi Masahiro, thanks for reviewing.
>
> On 4/22/24 5:39 PM, Masahiro Yamada wrote:
>
> On Mon, Apr 22, 2024 at 6:25=E2=80=AFPM Sathvika Vasireddy <sv@linux.ibm.=
com> wrote:
>
> Currently, when objtool is enabled and none of the supported options
> are triggered, kernel build errors out with the below error:
> error: objtool: At least one command required.
>
> Then, I think CONFIG_OBJTOOL should be disabled.
>
> A subsequent patch introduces --ftr-fixup as an option to objtool to do f=
eature fixup at build-time via CONFIG_HAVE_OBJTOOL_FTR_FIXUP option. If CON=
FIG_OBJTOOL is not selected, then objtool cannot be used to pass --ftr-fixu=
p option.
>
> In cases where none of the supported options (like --mcount on powerpc fo=
r example) is triggered, but still require --ftr-fixup option to be passed =
to objtool, we see "error: objtool: At least one command required" errors. =
So, to address this, run only when either of the config options are selecte=
d.
>
> Thanks,
> Sathvika



Same as my first comment.


Bad things happen because you select OBJTOOL.

Preferably, this should be a separate program
as in the first draft, but if you insist on
integrating it into objtool, I recommend keeping
CONFIG_OBJTOOL and CONFIG_HAVE_OBJTOOL_FTR_FIXUP
as separate, unlated options.


I attach a fix-up patch applicable on top of your work.




--=20
Best Regards
Masahiro Yamada

--000000000000302eec0617cc8ff3
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lvv8s1az0>
X-Attachment-Id: f_lvv8s1az0

ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggNDBmYjJjYTZmZTRjLi5jNWFj
MDEyNzQ4OTMgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0xMzI3LDYg
KzEzMjcsMTMgQEAgaWZkZWYgQ09ORklHX09CSlRPT0wKIHByZXBhcmU6IHRvb2xzL29ianRvb2wK
IGVuZGlmCiAKKyMgQ09ORklHX09CSlRPT0wgYW5kIENPTkZJR19IQVZFX09CSlRPT0xfRlRSX0ZJ
WFVQIGFyZSB1bnJlbGF0ZWQsIHNlcGFyYXRlCisjIG9wdGlvbnMuIEl0IHdhcyBpbnRlZ3JhdGVk
IGluIG9ianRvb2wgaW4gb3JkZXIgdG8gYm9ycm93IHRoZSBlbGYgcGFyc2VyLAorIyBidXQgdGhp
cyBpcyBkaWZmZXJlbnQgZnJvbSBob3cgdGhlIG90aGVyIG9ianRvb2wgY29tbWFuZHMgYXJlIHVz
ZWQuCitpZmRlZiBDT05GSUdfSEFWRV9PQkpUT09MX0ZUUl9GSVhVUAorcHJlcGFyZTogdG9vbHMv
b2JqdG9vbAorZW5kaWYKKwogaWZkZWYgQ09ORklHX0JQRgogaWZkZWYgQ09ORklHX0RFQlVHX0lO
Rk9fQlRGCiBwcmVwYXJlOiB0b29scy9icGYvcmVzb2x2ZV9idGZpZHMKZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKaW5kZXggODA2Mjg1YTI4
MjMxLi41NjRiNzNjYmZhM2QgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnCisrKyBi
L2FyY2gvcG93ZXJwYy9LY29uZmlnCkBAIC0yNiw3ICsyNiw3IEBAIGNvbmZpZyA2NEJJVAogY29u
ZmlnIEhBVkVfT0JKVE9PTF9GVFJfRklYVVAKICAgICAgICAgYm9vbAogICAgICAgICBkZWZhdWx0
IHkgaWYgQ1BVX0xJVFRMRV9FTkRJQU4gJiYgUFBDNjQKLSAgICAgICAgc2VsZWN0IE9CSlRPT0wK
KwkjIEhBVkVfT0JKVE9PTF9GVFJfRklYVVAgbXVzdCBub3Qgc2VsZWN0IE9CSlRPT0wKIAogY29u
ZmlnIExJVkVQQVRDSF82NAogCWRlZl9ib29sIFBQQzY0CmRpZmYgLS1naXQgYS9zY3JpcHRzL01h
a2VmaWxlLmxpYiBiL3NjcmlwdHMvTWFrZWZpbGUubGliCmluZGV4IDhmZmYyN2I5YmRjYi4uODU1
YWQwOTdmODVlIDEwMDY0NAotLS0gYS9zY3JpcHRzL01ha2VmaWxlLmxpYgorKysgYi9zY3JpcHRz
L01ha2VmaWxlLmxpYgpAQCAtMjU3LDEwICsyNTcsMTAgQEAgZHRjX2NwcF9mbGFncyAgPSAtV3As
LU1NRCwkKGRlcGZpbGUpLnByZS50bXAgLW5vc3RkaW5jICAgICAgICAgICAgICAgICAgICBcCiAJ
CSAkKGFkZHByZWZpeCAtSSwkKERUQ19JTkNMVURFKSkgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKIAkJIC11bmRlZiAtRF9fRFRTX18KIAotaWZkZWYgQ09ORklHX09CSlRPT0wKLQogb2JqdG9v
bCA6PSAkKG9ianRyZWUpL3Rvb2xzL29ianRvb2wvb2JqdG9vbAogCitpZmRlZiBDT05GSUdfT0JK
VE9PTAorCiBvYmp0b29sLWFyZ3MtJChDT05GSUdfSEFWRV9KVU1QX0xBQkVMX0hBQ0spCQkrPSAt
LWhhY2tzPWp1bXBfbGFiZWwKIG9ianRvb2wtYXJncy0kKENPTkZJR19IQVZFX05PSU5TVFJfSEFD
SykJCSs9IC0taGFja3M9bm9pbnN0cgogb2JqdG9vbC1hcmdzLSQoQ09ORklHX01JVElHQVRJT05f
Q0FMTF9ERVBUSF9UUkFDS0lORykJKz0gLS1oYWNrcz1za3lsYWtlCkBAIC0yODYsMTYgKzI4Niw3
IEBAIG9ianRvb2wtYXJncyA9ICQob2JqdG9vbC1hcmdzLXkpCQkJCQlcCiAKIGRlbGF5LW9ianRv
b2wgOj0gJChvciAkKENPTkZJR19MVE9fQ0xBTkcpLCQoQ09ORklHX1g4Nl9LRVJORUxfSUJUKSkK
IAotaWZuZXEgKCQob2JqdG9vbC1hcmdzLXkpLCkKIGNtZF9vYmp0b29sID0gJChpZiAkKG9ianRv
b2wtZW5hYmxlZCksIDsgJChvYmp0b29sKSAkKG9ianRvb2wtYXJncykgJEApCi1lbmRpZgotCi1j
bWRfb2JqdG9vbF92bWxpbnV4IDo9Ci1pZmVxICgkKENPTkZJR19IQVZFX09CSlRPT0xfRlRSX0ZJ
WFVQKSx5KQotY21kX29ianRvb2xfdm1saW51eCA9ICQoaWYgJChvYmp0b29sLWVuYWJsZWQpLCA7
ICQob2JqdG9vbCkgJChvYmp0b29sLWFyZ3MpICRAKQotdm1saW51eDoKLSAgICAkKGNtZF9vYmp0
b29sX3ZtbGludXgpCi1lbmRpZgogCiBjbWRfZ2VuX29ianRvb2xkZXAgPSAkKGlmICQob2JqdG9v
bC1lbmFibGVkKSwgeyBlY2hvIDsgZWNobyAnJEA6ICQkKHdpbGRjYXJkICQob2JqdG9vbCkpJyA7
IH0gPj4gJChkb3QtdGFyZ2V0KS5jbWQpCiAKZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUu
dm1saW51eCBiL3NjcmlwdHMvTWFrZWZpbGUudm1saW51eAppbmRleCAyZjRhNzE1NGU2NzYuLmYw
MmY5OWM2ZjM1NSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4CisrKyBiL3Nj
cmlwdHMvTWFrZWZpbGUudm1saW51eApAQCAtNTgsMTAgKzU4LDkgQEAgZXhpc3RpbmctdGFyZ2V0
cyA6PSAkKHdpbGRjYXJkICQoc29ydCAkKHRhcmdldHMpKSkKICMgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogIwogIyAgRm9yIGZlYXR1cmUgZml4dXAsIG9ianRvb2wgZG9lcyBu
b3QgcnVuIG9uIGluZGl2aWR1YWwKLSMgIHRyYW5zbGF0aW9uIHVuaXRzLiBSdW4gdGhpcyBvbiB2
bWxpbnV4IGluc3RlYWQuCisjICB0cmFuc2xhdGlvbiB1bml0cy4gUnVuIHRoaXMgb24gdm1saW51
eCBpbnN0ZWFkLiBPbmx5IGZvciBQb3dlclBDLgorIyAgVGhlIG90aGVyIG9ianRvb2wgY29tbWFu
ZHMgd29yayBvbiBpbmRpdmlkdWFsIG9iamVjdHMgb3Igdm1saW51eC5vLgogCi1vYmp0b29sLWVu
YWJsZWQgOj0gJChDT05GSUdfSEFWRV9PQkpUT09MX0ZUUl9GSVhVUCkKLQotdm1saW51eC1vYmp0
b29sLWFyZ3MtJChDT05GSUdfSEFWRV9PQkpUT09MX0ZUUl9GSVhVUCkgICs9IC0tZnRyLWZpeHVw
Ci0KLW9ianRvb2wtYXJncyA9ICQodm1saW51eC1vYmp0b29sLWFyZ3MteSkgLS1saW5rCitpZmRl
ZiBDT05GSUdfSEFWRV9PQkpUT09MX0ZUUl9GSVhVUAorY21kX29ianRvb2xfdm1saW51eCA9IDsg
JChvYmp0b29sKSAtLWZ0ci1maXh1cCAtLWxpbmsgJEAKK2VuZGlmCg==
--000000000000302eec0617cc8ff3--

