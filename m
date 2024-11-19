Return-Path: <linux-kbuild+bounces-4729-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAD79D2CED
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 18:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AF33B22C0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 17:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5775F1CEAAA;
	Tue, 19 Nov 2024 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIuWoD5L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D41D1E7C;
	Tue, 19 Nov 2024 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732036996; cv=none; b=eIOmgsXY80kTsl80+veNrRwdFhduPt5MjNs95tJNBDUt+Wv0jTtvbQMTY2bdn+dR7xQMtVH3TnebSmgYa+ezCgPs3qd/dsa8FoRROXi5XKe3QV04RQyzlqKKukLIwZbt7LDAlYjQY5ISwPsueIPf58dt9jqvMdr1AyNI4eeLl3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732036996; c=relaxed/simple;
	bh=Qm0DmK2/otYLi9MxrhjrpcdK31lIw8QIKSWNGb9beUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aquuTTd5bcDub+4zM64zPGb2wmQAmB3YCIKB8FohyfAxRaEjdaCpXBzR5X53oreOhwNAMTT3PB8RFCXhZI602SDrYYEvxkfz0t/7uCrUhOvHsxNHfp7K9fB3oOOQIsoW63h2RJgVMXqBTakHgLOfICunVa5qckYyfWb1hLr6lw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIuWoD5L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBE9C4AF0B;
	Tue, 19 Nov 2024 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732036995;
	bh=Qm0DmK2/otYLi9MxrhjrpcdK31lIw8QIKSWNGb9beUk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eIuWoD5L7136bJMwU7c5sZ33v+E6KqgnJeHXYy+zz966g/7JBa0hWu/GVAk6WAaWQ
	 cCZQGLYxdgJ/GrPDX2UV4/QNHZB9PFQvtyYtmNtYlgqHk92h5Kuw08GcWDc69GkxSF
	 L4FgyVxThiHR0IT+bT92eP3NfCUpxSnH23c+yVm7Zi9A//kMsaWPEr95tUx2m3KF33
	 Bws1Gylv0t0gnmXeWZ//RSeJfdj64mBNspxmqa6lnW7x6hvM8TjqTAdMEZHgdVj2ik
	 6NIyQi9RbCK6B+rW9cf01BvB/OB8QzMSqIIKRNRiQl3zvaGluYJT9vHoyklFez191J
	 vz1kUc22qu1dg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53da4fd084dso8991e87.0;
        Tue, 19 Nov 2024 09:23:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzY/OCFrsF/EPe5w6+RSZnT9qveocw8DoJUvnc4jQF3V04YHyWeseaC4YyY3VigCV6Cmp/DMJddvxQs5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfSrtUBcHdKGGVRiNR6NavZyESAWTATlHTMDpJnVMDudbcYP4W
	rL+5pixr7ouGIbCsOyDbwhqOcxxExVwXJz/FHVt5VtnGEdbjAdjOOYLfvFhJFELJiN2tufOU546
	yMYhQOxcFkH5z0HQLavSF04wUY3o=
X-Google-Smtp-Source: AGHT+IGA+YLkeMShimZMSDu/qFLnamzCmzyQPjXpN2lqr61+otjjHTJg4RVNE1aYBIZLqUKZpL2FbOhLSZWLZs0u1os=
X-Received: by 2002:a05:6512:110e:b0:539:e88f:2396 with SMTP id
 2adb3069b0e04-53dc0d8722bmr46626e87.24.1732036994424; Tue, 19 Nov 2024
 09:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113234526.402738-1-masahiroy@kernel.org> <20241113234526.402738-3-masahiroy@kernel.org>
 <20241119022730.GA2908286@thelio-3990X>
In-Reply-To: <20241119022730.GA2908286@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 20 Nov 2024 02:22:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATpu5zYwx7kmaknsPGLXt8n8uCXyFpdi5vZeFZiBxYkGw@mail.gmail.com>
Message-ID: <CAK7LNATpu5zYwx7kmaknsPGLXt8n8uCXyFpdi5vZeFZiBxYkGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: enable objtool for *.mod.o and additional
 kernel objects
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Borislav Petkov <bp@alien8.de>, Nikolay Borisov <nik.borisov@suse.com>, Marco Elver <elver@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000cb0cb5062747496d"

--000000000000cb0cb5062747496d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 11:27=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Hi Masahiro,
>
> On Thu, Nov 14, 2024 at 08:45:22AM +0900, Masahiro Yamada wrote:
> > Currently, objtool is disabled in scripts/Makefile.{modfinal,vmlinux}.
> >
> > This commit moves rule_cc_o_c and rule_as_o_S to scripts/Makefile.lib
> > and set objtool-enabled to y there.
> >
> > With this change, *.mod.o, .module-common.o,  builtin-dtb.o, and
> > vmlinux.export.o will now be covered by objtool.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> I am seeing some build failures when LTO is enabled with this change in
> -next as commit d8d3f6c6690c ("kbuild: enable objtool for *.mod.o and
> additional kernel objects").
>
>   $ printf 'CONFIG_LTO_%s\n' NONE=3Dn CLANG_THIN=3Dy >kernel/configs/thin=
lto.config
>
>   $ make -skj"$(nproc)" ARCH=3Dx86_64 LLVM=3D1 mrproper {def,thinlto.}con=
fig all
>   ...
>   .vmlinux.export.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
>   make[4]: *** [scripts/Makefile.vmlinux:13: .vmlinux.export.o] Error 1
>   ...
>
> When LTO is enabled, these files are LLVM bitcode, not ELF, so objtool
> can't process them:
>
>   $ file .vmlinux.export.o
>   .vmlinux.export.o: LLVM IR bitcode

Good catch!

I will squash the attached diff.

Thank you.


--
Best Regards
Masahiro Yamada

--000000000000cb0cb5062747496d
Content-Type: application/x-patch; name="0001-fixup.patch"
Content-Disposition: attachment; filename="0001-fixup.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m3oq2dwa0>
X-Attachment-Id: f_m3oq2dwa0

RnJvbSA2Njc0NjQ4MTRjZGQ3Y2Q0ZjYyNjk5YmUyZjdlNTg3MTU1N2FmMWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBUdWUsIDE5IE5vdiAyMDI0IDE3OjI5OjQyICswOTAwClN1YmplY3Q6IFtQQVRDSF0g
Zml4dXAKClNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5v
cmc+Ci0tLQogc2NyaXB0cy9NYWtlZmlsZS5idWlsZCB8IDYgKy0tLS0tCiBzY3JpcHRzL01ha2Vm
aWxlLmxpYiAgIHwgOSArKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQgYi9z
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkCmluZGV4IDI1MzhhOTI1ZTA0Yy4uNDE2NDliOGE2NjMxIDEw
MDY0NAotLS0gYS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkCisrKyBiL3NjcmlwdHMvTWFrZWZpbGUu
YnVpbGQKQEAgLTEyOSwxMSArMTI5LDcgQEAgJChvYmopLyUubGw6ICQob2JqKS8lLmMgRk9SQ0UK
IAogaXMtc2luZ2xlLW9iai1tID0gJChhbmQgJChwYXJ0LW9mLW1vZHVsZSksJChmaWx0ZXIgJEAs
ICQob2JqLW0pKSx5KQogCi0jIFdoZW4gYSBtb2R1bGUgY29uc2lzdHMgb2YgYSBzaW5nbGUgb2Jq
ZWN0LCB0aGVyZSBpcyBubyByZWFzb24gdG8ga2VlcCBMTFZNIElSLgotIyBNYWtlICQoTEQpIGNv
dmVydCBMTFZNIElSIHRvIEVMRiBoZXJlLgotaWZkZWYgQ09ORklHX0xUT19DTEFORwotY21kX2xk
X3NpbmdsZV9tID0gJChpZiAkKGlzLXNpbmdsZS1vYmotbSksIDsgJChMRCkgJChsZF9mbGFncykg
LXIgLW8gJCh0bXAtdGFyZ2V0KSAkQDsgbXYgJCh0bXAtdGFyZ2V0KSAkQCkKLWVuZGlmCituZWVk
LWxkLXNpbmdsZSA9ICQoaXMtc2luZ2xlLW9iai1tKQogCiBpZmRlZiBDT05GSUdfTU9EVkVSU0lP
TlMKICMgV2hlbiBtb2R1bGUgdmVyc2lvbmluZyBpcyBlbmFibGVkIHRoZSBmb2xsb3dpbmcgc3Rl
cHMgYXJlIGV4ZWN1dGVkOgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmlsZS5saWIgYi9zY3Jp
cHRzL01ha2VmaWxlLmxpYgppbmRleCBhZDZiOGRmYTU1MzAuLjdhYzY1NDE0Njk5YyAxMDA2NDQK
LS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5saWIKKysrIGIvc2NyaXB0cy9NYWtlZmlsZS5saWIKQEAg
LTMwMywxMCArMzAzLDE3IEBAIGVuZGVmCiAjIFRoZXNlIGFyZSBzaGFyZWQgYnkgc29tZSBNYWtl
ZmlsZS4qIGZpbGVzLgogCiBvYmp0b29sLWVuYWJsZWQgOj0geQorbmVlZC1sZC1zaW5nbGUgOj0g
eQorCisjIFdoZW4gYSBtb2R1bGUgY29uc2lzdHMgb2YgYSBzaW5nbGUgb2JqZWN0LCB0aGVyZSBp
cyBubyByZWFzb24gdG8ga2VlcCBMTFZNIElSLgorIyBNYWtlICQoTEQpIGNvdmVydCBMTFZNIElS
IHRvIEVMRiBoZXJlLgoraWZkZWYgQ09ORklHX0xUT19DTEFORworY21kX2xkX3NpbmdsZSA9ICQo
aWYgJChuZWVkLWxkLXNpbmdsZSksIDsgJChMRCkgJChsZF9mbGFncykgLXIgLW8gJCh0bXAtdGFy
Z2V0KSAkQDsgbXYgJCh0bXAtdGFyZ2V0KSAkQCkKK2VuZGlmCiAKIHF1aWV0X2NtZF9jY19vX2Mg
PSBDQyAkKHF1aWV0X21vZHRhZykgICRACiAgICAgICBjbWRfY2Nfb19jID0gJChDQykgJChjX2Zs
YWdzKSAtYyAtbyAkQCAkPCBcCi0JCSQoY21kX2xkX3NpbmdsZV9tKSBcCisJCSQoY21kX2xkX3Np
bmdsZSkgXAogCQkkKGNtZF9vYmp0b29sKQogCiBkZWZpbmUgcnVsZV9jY19vX2MKLS0gCjIuNDMu
MAoK
--000000000000cb0cb5062747496d--

