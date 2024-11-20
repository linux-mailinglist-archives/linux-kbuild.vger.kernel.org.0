Return-Path: <linux-kbuild+bounces-4750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C51A9D3A04
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 12:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D64C1F25C3F
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 11:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8C71A3031;
	Wed, 20 Nov 2024 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgWvGCsH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE3019F41D;
	Wed, 20 Nov 2024 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103738; cv=none; b=tAfag9V4oL1O1+kEQXKlwpXrT+Hmx7ctYt/3artevdK5lIKA3s1iiQg+Zp08AkIyLBg2TsPKHn+spnEAiZmcOeUPLgr1VvXLMVEEw1d9y2mEvrMRu92JWaRuTobq6D2bHVaqTpdXa70B/xwEhHX64tontnQOwuEeh0Tb8aOPiSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103738; c=relaxed/simple;
	bh=4iNBk7LC9TBZYuo0MXULQ9ayjztNWrRDsjTo4k/+edQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFeHM4W2PvTUk1536TKP5Uxm37Kwj6Uq8/mC7x2fpzMniDG0o+rEFk1VHMcCB4XRsiHLXrZfJRHDkExs6CzL+g0bfncOVefBFA1N5ic3o5/vB+RiNETxBsgOAbZgVNbeCcj7W/RbOSyKaj4lyf8/iB0uEyYF86+1d/Y8s6Tac2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgWvGCsH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48165C4CECD;
	Wed, 20 Nov 2024 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732103738;
	bh=4iNBk7LC9TBZYuo0MXULQ9ayjztNWrRDsjTo4k/+edQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CgWvGCsHjyFVOTC96wfamrt4sOOgTlSoVorRBJ6/K1dombsbJkqD/MOFkhPecxZS/
	 lu9zfHTuItNbK19LcgKaf+/imv5yAWabYtabqZQnWX1F5a51Zsf2qaf+8wCaxHf6kq
	 xNmAF0uZpEt0qvo0SRHkvRMrwKRBPNwkBgl9LaV5gGCNT/zjbUMdwwlHNZTrkNxeCL
	 DDGQNQ31ENSaO5bEAPqiqSqbr1WzoTY269ChZCcJArjbak0caAgdBquxAFweHp6xs+
	 3gIjqMlWegWF1849MdnqdWx4pZIMTrssIet+O3Ajbgd6aBb7ST/XEJP1mVyZySfg7X
	 BsPyVPAnSzyGQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53d9ff8f1e4so5089485e87.2;
        Wed, 20 Nov 2024 03:55:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAh2Gd0xUJGBB6Xl/n751WiQTZR753kyUmRreHzjUJMjz2HvJRIwwnlX351rns3cVY3l0IF2zeEXbOrXA=@vger.kernel.org, AJvYcCVcUFS7B7LrcP40NnLr8KCigeOEkI/ZgAOSrAPay77IHYCxkOFSqN3qxMgWgFdgZy76Zmw7TAw2Y39eVIFh@vger.kernel.org, AJvYcCVkd/4aDyIq8h5+G8jRX+eNSSayHvkQqdwJ2hd1/y5EAq+CRy5IjCOvwuNKJ3+xJ2ToeHr7o/hqpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxclzsF+KTxfO4K6jj5LSP9tcZHqBL/ICOyv2gbs/0KwfKTdqTx
	I/l68fOVfQhyu4M3HyHxPymiuVGX54aquwKsgsxf/VYHV0Apdr5Fo/uVlTsoJ/mdbIt938A2PtD
	vbL5mEYp/yu6ZDa+0SvboM9fLDk0=
X-Google-Smtp-Source: AGHT+IHG318RoJAh5CCrn2UIYr+ZKfZsLdJ+iqL7RCmLwigjuBULnm1HPMkT53qRCaItAM3pDWyEF+zB7dD+9Cd7O08=
X-Received: by 2002:a05:6512:10cd:b0:53d:a012:eed4 with SMTP id
 2adb3069b0e04-53dc1374266mr1023236e87.52.1732103736977; Wed, 20 Nov 2024
 03:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-selinux-clean-v1-1-68704e007f7a@linutronix.de>
In-Reply-To: <20241120-selinux-clean-v1-1-68704e007f7a@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 20 Nov 2024 20:55:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUnCPt03BRFSKh1EH=+Sy0Q48wE4ER0BZdJqOb_44L8w@mail.gmail.com>
Message-ID: <CAK7LNATUnCPt03BRFSKh1EH=+Sy0Q48wE4ER0BZdJqOb_44L8w@mail.gmail.com>
Subject: Re: [PATCH] selinux: explicitly clean generated av_permissions.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f51c87062756d36c"

--000000000000f51c87062756d36c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 6:15=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> av_permissions.h is not declared as a target and therefore won't be
> added to clean-files automatically by kbuild.
> For details why it is not a target see the Makefile itself.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  security/selinux/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/security/selinux/Makefile b/security/selinux/Makefile
> index 86f0575f670da66a9dc57e13a236d6a5551af38e..58129a7c8cfa08f9caf5444f7=
df776f41056b77a 100644
> --- a/security/selinux/Makefile
> +++ b/security/selinux/Makefile
> @@ -41,5 +41,8 @@ targets +=3D flask.h
>  $(obj)/flask.h: $(obj)/genheaders FORCE
>         $(call if_changed,genhdrs)
>
> +# see the note above, remove this line
> +clean-files +=3D av_permissions.h
> +
>  hostprogs :=3D genheaders
>  HOST_EXTRACFLAGS +=3D -I$(srctree)/security/selinux/include



Presumably, the attached fixup.diff (comment in 'targets' assignment)
would align with the intention of the maintainer of this Makefile
because you can do

  targets +=3D $(genhdrs)

without the need of the grouped target feature.
'make clean' removes files listed in 'targets'.



BTW, the NOTE in this Makefile is not true.
  https://github.com/torvalds/linux/blob/v6.12/security/selinux/Makefile#L7


Even if you use GNU Make 4.3, the grouped target does not work with
the if_changed macro.

With GNU Make 4.4, it will work as a side-effect of commit
fabb03eac412b5ea19f1a97be31dc8c6fa7fc047


I asked about this behavior some time ago in GNU Make ML.

https://lists.gnu.org/archive/html/help-make/2024-08/msg00001.html
  or
https://savannah.gnu.org/bugs/index.php?66073


The combination of the grouped target and if_changed
is working with GNU Make 4.4+, but I do not know if
it is future promising.



IMHO, I do not see much benefits for using the group target in this case
because you can still generate flask.h and av_permissions.h
separately.






>
> ---
> base-commit: bf9aa14fc523d2763fc9a10672a709224e8fcaf4
> change-id: 20241120-selinux-clean-dfcd0e7a344b
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>


--=20
Best Regards
Masahiro Yamada

--000000000000f51c87062756d36c
Content-Type: text/x-patch; charset="US-ASCII"; name="fixup.diff"
Content-Disposition: attachment; filename="fixup.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m3ptnxzt0>
X-Attachment-Id: f_m3ptnxzt0

ZGlmZiAtLWdpdCBhL3NlY3VyaXR5L3NlbGludXgvTWFrZWZpbGUgYi9zZWN1cml0eS9zZWxpbnV4
L01ha2VmaWxlCmluZGV4IDg2ZjA1NzVmNjcwZC4uYmVkZWYwMzczZWY5IDEwMDY0NAotLS0gYS9z
ZWN1cml0eS9zZWxpbnV4L01ha2VmaWxlCisrKyBiL3NlY3VyaXR5L3NlbGludXgvTWFrZWZpbGUK
QEAgLTMzLDExICszMywxMCBAQCAkKGFkZHByZWZpeCAkKG9iaikvLCQoc2VsaW51eC15KSk6ICQo
b2JqKS9mbGFzay5oCiBxdWlldF9jbWRfZ2VuaGRycyA9IEdFTiAgICAgJChhZGRwcmVmaXggJChv
YmopLywkKGdlbmhkcnMpKQogICAgICAgY21kX2dlbmhkcnMgPSAkPCAkKGFkZHByZWZpeCAkKG9i
aikvLCQoZ2VuaGRycykpCiAKLSMgc2VlIHRoZSBub3RlIGFib3ZlLCByZXBsYWNlIHRoZSAkdGFy
Z2V0cyBhbmQgJ2ZsYXNrLmgnIHJ1bGUgd2l0aCB0aGUgbGluZXMKK3RhcmdldHMgKz0gJChnZW5o
ZHJzKQorIyBzZWUgdGhlIG5vdGUgYWJvdmUsIHJlcGxhY2UgdGhlICdmbGFzay5oJyBydWxlIHdp
dGggdGhlIGxpbmVzCiAjIGJlbG93OgotIyAgdGFyZ2V0cyArPSAkKGdlbmhkcnMpCiAjICAkKGFk
ZHByZWZpeCAkKG9iaikvLCQoZ2VuaGRycykpICY6ICQob2JqKS9nZW5oZWFkZXJzIEZPUkNFCi10
YXJnZXRzICs9IGZsYXNrLmgKICQob2JqKS9mbGFzay5oOiAkKG9iaikvZ2VuaGVhZGVycyBGT1JD
RQogCSQoY2FsbCBpZl9jaGFuZ2VkLGdlbmhkcnMpCiAK
--000000000000f51c87062756d36c--

