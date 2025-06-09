Return-Path: <linux-kbuild+bounces-7411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F9AD1B60
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 12:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9574E16C1B4
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 10:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991922517A4;
	Mon,  9 Jun 2025 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0rZdsq5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B9A252295
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Jun 2025 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464258; cv=none; b=stBRXiTxRKLbo4fOPJXs9Et6mqi+YujvkLbW+KfS8bYRdKnvrru1qE+ODinKCXYTBw+hF3fmaxmSJalKIWXqoSl4YDBcWXDJ5cXHLXuChlCUkeCEFRiRycXQ9jJ3cjwfXb943hevehVbLvvP28SiYWQZxrBHnUFCc0j9lLHSuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464258; c=relaxed/simple;
	bh=+dZwwZnEUydRjC2XaUcXrBAeVqUx1EKmNirB5Fg4QFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tES58IgqABh8OiT3prFv8AxOZ6tQEa8t68LRn/FWttfiuJgcu0PQIBFwCluwADmqgFkGfoORcOFq+gsXy4gMQrxlB3GZl4w87Sz+294unePEGDKw73+FPkMCXCw33bE7EcRfbJy11ScG4oKXl0AfKOVx1N6KE+Da70diO4nzBks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0rZdsq5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C12C4CEED
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Jun 2025 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749464256;
	bh=+dZwwZnEUydRjC2XaUcXrBAeVqUx1EKmNirB5Fg4QFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E0rZdsq55+xqFDLK/UGvtnHfVbY6adWGQYs1QJPwHDDDKPqRM43ul396d2N+niS02
	 i972XN8ykHy+kluy4M5Ze/4fUNzReGo1l5DpT5MBY1MWziG88we/rySUf8Bh6boAsk
	 F/1Oxkq9YcVCFCkqype5xE0x6iBPxToRy3Bg3nH71syQkE10kelb3rjSdEQCXLHV49
	 JmqfcE92rJ0egxG2fH21wrWWxEtX9SyG+JuvGj1yM81dXj4K4y+jsZoAAWOGyWQoML
	 weXPg83Fjw4GHAEgrUiYIMfcFEGe+4GmPfsQNCy8CGTZnuk6sUv6zbZr/mYsXhjJTZ
	 X7DvrPuMTgZCw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5536b9be5f6so1922458e87.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jun 2025 03:17:35 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy46eWsGV3yjTn044FKT2SdIHrIo+KZYwPU/gjenU8VaBUNfz4J
	1Gi6H7fCGs/LhbwwfLpFfhtN1UFhgogb6x7zIcGFeg295k5+b3dMrozEMcJCuZuklMMRwGrljqW
	4vgQZJipP+t1hcrZX8h8CA8qCvSQyr9U=
X-Google-Smtp-Source: AGHT+IFQwLnSqYsS+v0fajeb6czr5EK7YLWBnpRwDKh+Mv/mgocXTwZXEQYnVe6s+RfavVC0HypYDlQf5hmd6XZZiUI=
X-Received: by 2002:a05:6512:4010:b0:553:522f:61c9 with SMTP id
 2adb3069b0e04-55366bdcc76mr3047665e87.1.1749464254486; Mon, 09 Jun 2025
 03:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAF7b7mo6g46zJMPPBfiUrNosBC+t3TKwWCBCUkh55f+6MiYQBA@mail.gmail.com>
In-Reply-To: <CAF7b7mo6g46zJMPPBfiUrNosBC+t3TKwWCBCUkh55f+6MiYQBA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 19:16:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQEq1fMWaFLUt3fbwu5gnG_+Ry=1_mxXCuBk_d1=ykcPQ@mail.gmail.com>
X-Gm-Features: AX0GCFs6aUrd-7m7JJaopcpxijvi9x_1r_V61eFM-rlzwDhAiEpyFUmuINVULJM
Message-ID: <CAK7LNAQEq1fMWaFLUt3fbwu5gnG_+Ry=1_mxXCuBk_d1=ykcPQ@mail.gmail.com>
Subject: Re: Generating .cmd files without actually building the kernel?
To: Anish Moorthy <amoorthy@google.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006fbabb063720e3f0"

--0000000000006fbabb063720e3f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 1:06=E2=80=AFAM Anish Moorthy <amoorthy@google.com> =
wrote:
>
> Does anyone know/have ideas on how to do this? I'd like to be able to
> generate compile_commands.json and browse the kernel code without
> having to build the whole thing.


What a coincidence, I was also thinking about this.

Unlike ninja-build, Makefiles in Kbuild are not structured flat.

So, supporting dry-run mode needs several amendments everywhere,
(and it is not easily maintainable)
If interested, RFC exists. [1]

Of course, the complete dry-run is not desired here,
since we need to generate .*.cmd files at least.


I just proto-typed this and attached a patch.
The implementation is hacky, and I am not sure
if this should land in the main line.

Please let me know whether the attached patch works for you.



[1]: https://lore.kernel.org/linux-kbuild/20240819160309.2218114-1-vegard.n=
ossum@oracle.com/




>
> It seems to me that the basic change/hack should be something like
> [1]. But of course, it's not that simply just applying that patch and
> then running "make defconfig; make" runs into an error pretty quickly
>
> > $ make defconfig
> > $ make
> > ...
> > ./scripts/basic/fixdep scripts/mod/.empty.o.d scripts/mod/empty.o '${GC=
C_COMMAND_HERE}' > scripts/mod/.empty.o.cmd; rm -f scripts/mod/.empty.o.d
> >fixdep: error opening file: scripts/mod/.empty.o.d: No such file or dire=
ctory
>   HOSTCC  scripts/mod/mk_elfconfig
>   MKELF   scripts/mod/elfconfig.h
> > /bin/sh: line 1: scripts/mod/empty.o: No such file or directory
> > make[2]: *** [scripts/mod/Makefile:25: scripts/mod/elfconfig.h] Error 1
> > make[1]: *** [/usr/local/google/home/amoorthy/linux/Makefile:1271: prep=
are0] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
>
> I take it the gcc command itself is generating the .d files, which I
> guess makes sense given the existence of gcc's -MF flag (though grep's
> not good enough for me to figure out where we're setting thins). I
> tried
>
> > $ make CFLAGS=3D"-E"
>
> too under the theory that this would generate the .o.d files, but this
> just dies elsewhere
>
> >  exec-cmd.c:2:10: fatal error: linux/compiler.h: No such file or direct=
ory
>     2 | #include <linux/compiler.h>
>       |          ^~~~~~~~~~~~~~~~~~
> > compilation terminated.
>
> Anyways, I've spent a fair chunk of time trying to understand the
> system at this point, but I'm really still just fumbling around:
> figured I'd try asking for help.
>
>
>
> [1]
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8c311b997e24..a17cdfa7ab72 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -208,6 +208,10 @@ cmd_and_fixdep =3D
>                            \
>         $(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' >
> $(dot-target).cmd;\
>         rm -f $(depfile)
>
> +savecmd_and_fixdep =3D
>            \
> +       $(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' >
> $(dot-target).cmd;\
> +       rm -f $(depfile)
> +
>  # Usage: $(call if_changed_rule,foo)
>  # Will check if $(cmd_foo) or any of the prerequisites changed,
>  # and if so will execute $(rule_foo).
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 4d543054f723..9fcb41f96d89 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -318,7 +318,7 @@ quiet_cmd_cc_o_c =3D CC $(quiet_modtag)  $@
>                 $(cmd_objtool)
>
>  define rule_cc_o_c
> -       $(call cmd_and_fixdep,cc_o_c)
> +       $(call savecmd_and_fixdep,cc_o_c)
>         $(call cmd,checksrc)
>         $(call cmd,checkdoc)
>         $(call cmd,gen_objtooldep)
>


--
Best Regards
Masahiro Yamada

--0000000000006fbabb063720e3f0
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-No-Merge-kbuild-support-dry-run-and-generating-compi.patch"
Content-Disposition: attachment; 
	filename="0001-No-Merge-kbuild-support-dry-run-and-generating-compi.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mboxpeui0>
X-Attachment-Id: f_mboxpeui0

RnJvbSA4Nzg3ZTI3NWZhZmQ1N2VkZTRmMDNkNzViNzQyZGNkNGE5YTMwNGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBTYXQsIDcgSnVuIDIwMjUgMjA6MTk6MjkgKzA5MDAKU3ViamVjdDogW1BBVENIXSBb
Tm8tTWVyZ2Vda2J1aWxkOiBzdXBwb3J0IGRyeS1ydW4gYW5kIGdlbmVyYXRpbmcKIGNvbXBpbGVf
Y29tbWFuZHMuanNvbiBxdWlja2x5IChFWFBFUklNRU5UQUwpCgpUaGlzIHBhdGNoIGltcGxlbWVu
dHMgZXhwZXJpbWVudGFsIHN1cHBvcnQgZm9yIHRoZSBkcnktcnVuIG1vZGUuCldoZW4geW91IHBh
c3MgVj0zLCBLYnVpbGQgcnVucyB0aGUgZHJ5LXJ1biBtb2RlLCB3aGVyZSBLYnVpbGQganVzdApj
cmVhdGVzIGFuIGVtcHR5IHRhcmdldCBmaWxlIGZvciBtb3N0IHJ1bGVzLgoKVGhlIG1haW4gbW90
aXZhdGlvbiBpcyB0byBxdWlja2x5IGdlbmVyYXRlIGNvbXBpbGVfY29tbWFuZHMuanNvbgp3aXRo
b3V0IGJ1aWxkaW5nIHRoZSBlbnRpcmUgdHJlZS4KCltVc2FnZSAxXSBkcnktcnVuIGFsbG1vZGNv
bmZpZwoKVGhpcyBpcyBub3Qgc28gaW50ZXJlc3RpbmcsIGJ1dCB5b3UgY2FuIGdldCBhIHF1aWNr
IGlkZWEKaG93IG1hbnkgb2JqZWN0cyB3b3VsZCBiZSBjb21waWxlZCB3aXRoIGFsbG1vZGNvbmZp
ZwoKICAkIG1ha2UgY2xlYW4KICAkIG1ha2UgYWxsbW9kY29uZmlnCiAgJCBtYWtlIC1qJChucHJv
YykgVj0zIGFsbAoKW1VzYWdlIDJdIGdlbmVyYXRlIGNvbXBpbGVfY29tbWFuZHMuanNvbiBxdWlj
a2x5CgogICQgbWFrZSBjbGVhbgogICQgbWFrZSBhbGxtb2Rjb25maWcKICAkIG1ha2UgLWokKG5w
cm9jKSBWPTMgY29tcGlsZV9jb21tYW5kcy5qc29uCgogICA6Q0MgW01dICBkcml2ZXJzL2h3bW9u
L3dtODMxeC1od21vbi5vCiAgIDpDQyBbTV0gIGRyaXZlcnMvaHdtb24vd204MzUwLWh3bW9uLm8K
ICAgOkNDIFtNXSAgZHJpdmVycy9od21vbi94Z2VuZS1od21vbi5vCiAgIDpMRCBbTV0gIGRyaXZl
cnMvaWlvL2FkYy94aWxpbngteGFkYy5vCiAgIDpMRCBbTV0gIGRyaXZlcnMvaHdtb24vbmN0Njc3
NS5vCiAgICBBUiAgICAgIGJ1aWx0LWluLmEKICAgIEFSICAgICAgdm1saW51eC5hCiAgICBHRU4g
ICAgIGNvbXBpbGVfY29tbWFuZHMuanNvbgogID09PT09PT09PT09PSBOT1RJQ0UgTk9USUNFIE5P
VElDRSA9PT09PT09PT09PT09CiAgVGhlIGRyeS1ydW4gbW9kZSAoVj0zKSBjb3JydXB0cyB0aGUg
YnVpbGQgdHJlZS4KICBQbGVhc2UgcnVuICdtYWtlIGNsZWFuJyB3aGVuIHlvdSBhcmUgZG9uZS4K
ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKTm90ZToK
CiAtIFRoZSBjb2xvbiBzdWZmaXggOiBtZWFucyB0aGUgZGVmYXVsdCBiZWhhdmlvciBvZiB0aGUg
ZHJ5LXJ1biBtb2RlLgogICBLYnVpbGQganVzdCBjcmVhdGVkIGFuIGVtcHR5IHRhcmdldCBmaWxl
IGluc3RlYWQgb2YgaW52b2tpbmcgdGhlCiAgIHRvb2xjaGFpbi4KCiAtIEFmdGVyIHVzaW5nIHRo
ZSBkcnktcnVuIG1vZGUsIHBsZWFzZSBydW4gIm1ha2UgY2xlYW4iIGJlY2F1c2UgdGhlCiAgIGJ1
aWxkIHRyZWUgaXMgYWxyZWFkeSBtZXNzZWQgdXA7IG1vc3Qgb2YgdGhlIG9iamVjdHMgYXJlIGVt
cHR5IGZpbGVzCiAgIGJ1dCB0aGVpciB0aW1lc3RhbXAgYXJlIHVwLXRvLWRhdGUuIFNvLCBLYnVp
bGQgY2Fubm90IGZpeCB0aGUgdHJlZQogICB3aXRob3V0ICJtYWtlIGNsZWFuIgoKU2lnbmVkLW9m
Zi1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KLS0tCiBNYWtlZmls
ZSAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysrKysrLQoga2VybmVsL01ha2VmaWxl
ICAgICAgICAgICAgfCAgMSArCiBzY3JpcHRzL0tidWlsZC5pbmNsdWRlICAgICB8IDE3ICsrKysr
KysrKysrKysrLS0tCiBzY3JpcHRzL01ha2VmaWxlLmJ1aWxkICAgICB8ICAzICsrKwogc2NyaXB0
cy9NYWtlZmlsZS5tb2Rwb3N0ICAgfCAgMyArKy0KIHNjcmlwdHMvTWFrZWZpbGUudm1saW51eCAg
IHwgIDEgKwogc2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4X28gfCAgMSArCiA3IGZpbGVzIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvTWFrZWZp
bGUgYi9NYWtlZmlsZQppbmRleCAzNWU2ZTUyNDBjNjEuLjI0Zjg4MGNmYTVkNiAxMDA2NDQKLS0t
IGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTg1LDEyICs4NSwxNyBAQCBlbmRpZgogCiBx
dWlldCA9IHF1aWV0XwogUSA9IEAKK2RyeXJ1biA9CiAKIGlmbmVxICgkKGZpbmRzdHJpbmcgMSwg
JChLQlVJTERfVkVSQk9TRSkpLCkKICAgcXVpZXQgPQogICBRID0KIGVuZGlmCiAKK2lmbmVxICgk
KGZpbmRzdHJpbmcgMywgJChLQlVJTERfVkVSQk9TRSkpLCkKKyAgZHJ5cnVuID0gMQorZW5kaWYK
KwogIyBJZiB0aGUgdXNlciBpcyBydW5uaW5nIG1ha2UgLXMgKHNpbGVudCBtb2RlKSwgc3VwcHJl
c3MgZWNob2luZyBvZgogIyBjb21tYW5kcwogaWZuZXEgKCQoZmluZHN0cmluZyBzLCQoZmlyc3R3
b3JkIC0kKE1BS0VGTEFHUykpKSwpCkBAIC05OCw3ICsxMDMsNyBAQCBxdWlldD1zaWxlbnRfCiBv
dmVycmlkZSBLQlVJTERfVkVSQk9TRSA6PQogZW5kaWYKIAotZXhwb3J0IHF1aWV0IFEgS0JVSUxE
X1ZFUkJPU0UKK2V4cG9ydCBxdWlldCBRIGRyeXJ1biBLQlVJTERfVkVSQk9TRQogCiAjIENhbGwg
YSBzb3VyY2UgY29kZSBjaGVja2VyIChieSBkZWZhdWx0LCAic3BhcnNlIikgYXMgcGFydCBvZiB0
aGUKICMgQyBjb21waWxhdGlvbi4KQEAgLTEyMDIsNiArMTIwNyw3IEBAIEtCVUlMRF9NT0RVTEVT
IDo9IHkKIGVuZGlmCiAKICMgJyQoQVIpIG1QaScgbmVlZHMgJ1QnIHRvIHdvcmthcm91bmQgdGhl
IGJ1ZyBvZiBsbHZtLWFyIDw9IDE0CitkcnlydW5fY21kX2FyX3ZtbGludXguYSA9ICQoY21kX2Fy
X3ZtbGludXguYSkKIHF1aWV0X2NtZF9hcl92bWxpbnV4LmEgPSBBUiAgICAgICRACiAgICAgICBj
bWRfYXJfdm1saW51eC5hID0gXAogCXJtIC1mICRAOyBcCkBAIC0yMDYzLDYgKzIwNjksNyBAQCBu
c2RlcHM6IG1vZHVsZXMKICMgQ2xhbmcgVG9vbGluZwogIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAor
ZHJ5cnVuX2NtZF9nZW5fY29tcGlsZV9jb21tYW5kcyA9ICQoY21kX2dlbl9jb21waWxlX2NvbW1h
bmRzKQogcXVpZXRfY21kX2dlbl9jb21waWxlX2NvbW1hbmRzID0gR0VOICAgICAkQAogICAgICAg
Y21kX2dlbl9jb21waWxlX2NvbW1hbmRzID0gJChQWVRIT04zKSAkPCAtYSAkKEFSKSAtbyAkQCAk
KGZpbHRlci1vdXQgJDwsICQocmVhbC1wcmVyZXFzKSkKIApAQCAtMjA3MCw2ICsyMDc3LDEyIEBA
IGNvbXBpbGVfY29tbWFuZHMuanNvbjogJChzcmN0cmVlKS9zY3JpcHRzL2NsYW5nLXRvb2xzL2dl
bl9jb21waWxlX2NvbW1hbmRzLnB5IFwKIAkkKGlmICQoS0JVSUxEX0VYVE1PRCksLCB2bWxpbnV4
LmEgJChLQlVJTERfVk1MSU5VWF9MSUJTKSkgXAogCSQoaWYgJChDT05GSUdfTU9EVUxFUyksIG1v
ZHVsZXMub3JkZXIpIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQsZ2VuX2NvbXBpbGVfY29tbWFu
ZHMpCitpZmRlZiBkcnlydW4KKwlAZWNobyAiPT09PT09PT09PT09IE5PVElDRSBOT1RJQ0UgTk9U
SUNFID09PT09PT09PT09PT0iCisJQGVjaG8gIlRoZSBkcnktcnVuIG1vZGUgKFY9MykgY29ycnVw
dHMgdGhlIGJ1aWxkIHRyZWUuIgorCUBlY2hvICJQbGVhc2UgcnVuICdtYWtlIGNsZWFuJyB3aGVu
IHlvdSBhcmUgZG9uZS4iCisJQGVjaG8gIj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09IgorZW5kaWYKIAogdGFyZ2V0cyArPSBjb21waWxlX2NvbW1hbmRzLmpz
b24KIApkaWZmIC0tZ2l0IGEva2VybmVsL01ha2VmaWxlIGIva2VybmVsL01ha2VmaWxlCmluZGV4
IDMyZTgwZGQ2MjZhZi4uMzRhN2JlMzg5NWM5IDEwMDY0NAotLS0gYS9rZXJuZWwvTWFrZWZpbGUK
KysrIGIva2VybmVsL01ha2VmaWxlCkBAIC0xNjAsNiArMTYwLDcgQEAgJChvYmopL2NvbmZpZ19k
YXRhOiAkKEtDT05GSUdfQ09ORklHKSBGT1JDRQogCiAkKG9iaikva2hlYWRlcnMubzogJChvYmop
L2toZWFkZXJzX2RhdGEudGFyLnh6CiAKK2RyeXJ1bl9jbWRfZ2VuaWtoID0gdGVzdCAtZiAkQCB8
fCB0b3VjaCAkQAogcXVpZXRfY21kX2dlbmlraCA9IENISyAgICAgJChvYmopL2toZWFkZXJzX2Rh
dGEudGFyLnh6CiAgICAgICBjbWRfZ2VuaWtoID0gJChDT05GSUdfU0hFTEwpICQoc3JjdHJlZSkv
a2VybmVsL2dlbl9raGVhZGVycy5zaCAkQAogJChvYmopL2toZWFkZXJzX2RhdGEudGFyLnh6OiBG
T1JDRQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9LYnVpbGQuaW5jbHVkZSBiL3NjcmlwdHMvS2J1aWxk
LmluY2x1ZGUKaW5kZXggOGMzMTFiOTk3ZTI0Li5jMzg0ZmM4OWJiYWIgMTAwNjQ0Ci0tLSBhL3Nj
cmlwdHMvS2J1aWxkLmluY2x1ZGUKKysrIGIvc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQpAQCAtMTIz
LDkgKzEyMywxNCBAQCBjbGVhbiA6PSAtZiAkKHNyY3RyZWUpL3NjcmlwdHMvTWFrZWZpbGUuY2xl
YW4gb2JqCiAjIElmIHF1aWV0IGlzICJzaWxlbnRfIiwgcHJpbnQgbm90aGluZyBhbmQgc2luayBz
dGRvdXQKICMgSWYgcXVpZXQgaXMgInF1aWV0XyIsIHByaW50IHNob3J0IGxvZwogIyBJZiBxdWll
dCBpcyBlbXB0eSwgcHJpbnQgc2hvcnQgbG9nIGFuZCB3aG9sZSBjb21tYW5kCisKKyMgV2hlbiB0
aGUgZHJ5LXJ1biBtb2RlIGlzIGVuYWJsZWQgYW5kIHdlIGFyZSBqdXN0IGRvaW5nIGEgbm8tb3AK
KyMgKGp1c3QgY3JlYXRpbmcgYW4gZW1wdHkgdGFyZ2V0IGZpbGUpLCAnOicgaXMgYW5ub3RhdGVk
LgorcXVpZXRfZHJ5cnVuX3RhZyA9ICQoaWYgJChkcnlydW4pLCQoaWYgJChkcnlydW5fY21kXyQx
KSwgLDopLCApCisKIHNpbGVudF9sb2dfcHJpbnQgPSBleGVjID4vZGV2L251bGw7Ci0gcXVpZXRf
bG9nX3ByaW50ID0gJChpZiAkKHF1aWV0X2NtZF8kMSksIGVjaG8gJyAgJChjYWxsIGVzY3NxLCQo
cXVpZXRfY21kXyQxKSQod2h5KSknOykKLSAgICAgICBsb2dfcHJpbnQgPSBlY2hvICckKHBvdW5k
KSAkKGNhbGwgZXNjc3EsJChvciAkKHF1aWV0X2NtZF8kMSksY21kXyQxICRAKSQod2h5KSknOyBc
CisgcXVpZXRfbG9nX3ByaW50ID0gJChpZiAkKHF1aWV0X2NtZF8kMSksIGVjaG8gJyAkKHF1aWV0
X2RyeXJ1bl90YWcpJChjYWxsIGVzY3NxLCQocXVpZXRfY21kXyQxKSQod2h5KSknOykKKyAgICAg
ICBsb2dfcHJpbnQgPSBlY2hvICckKHBvdW5kKSQocXVpZXRfZHJ5cnVuX3RhZykkKGNhbGwgZXNj
c3EsJChxdWlldF9kcnlydW5fdGFnKSQob3IgJChxdWlldF9jbWRfJDEpLGNtZF8kMSAkQCkkKHdo
eSkpJzsgXAogICAgICAgICAgICAgICAgICAgIGVjaG8gJyAgJChjYWxsIGVzY3NxLCQoY21kXyQx
KSknOwogCiAjIERlbGV0ZSB0aGUgdGFyZ2V0IG9uIGludGVycnVwdGlvbgpAQCAtMTQ5LDggKzE1
NCwxMCBAQCBkZWxldGUtb24taW50ZXJydXB0ID0gXAogCQkkKGZvcmVhY2ggc2lnLCBIVVAgSU5U
IFFVSVQgVEVSTSBQSVBFLCBcCiAJCQl0cmFwICdybSAtZiAkQDsgdHJhcCAtICQoc2lnKTsga2ls
bCAtcyAkKHNpZykgJCQkJCcgJChzaWcpOykpCiAKK21heWJlLWRyeXJ1bi1jbWQgPSAkKGlmICQo
ZHJ5cnVuKSwkKG9yICQoZHJ5cnVuX2NtZF8kKDEpKSxta2RpciAtcCAkKEBEKTsgOiA+ICRAKSwk
KGNtZF8kKDEpKSkKKwogIyBwcmludCBhbmQgZXhlY3V0ZSBjb21tYW5kcwotY21kID0gQCQoaWYg
JChjbWRfJCgxKSksc2V0IC1lOyAkKCQocXVpZXQpbG9nX3ByaW50KSAkKGRlbGV0ZS1vbi1pbnRl
cnJ1cHQpICQoY21kXyQoMSkpLDopCitjbWQgPSBAJChpZiAkKGNtZF8kKDEpKSxzZXQgLWU7ICQo
JChxdWlldClsb2dfcHJpbnQpICQoZGVsZXRlLW9uLWludGVycnVwdCkgJChtYXliZS1kcnlydW4t
Y21kKSw6KQogCiAjIyMKICMgaWZfY2hhbmdlZCAgICAgIC0gZXhlY3V0ZSBjb21tYW5kIGlmIGFu
eSBwcmVyZXF1aXNpdGUgaXMgbmV3ZXIgdGhhbgpAQCAtMjA4LDYgKzIxNSwxMCBAQCBjbWRfYW5k
X2ZpeGRlcCA9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKIAkkKG9ianRyZWUpL3NjcmlwdHMvYmFzaWMvZml4ZGVwICQoZGVwZmls
ZSkgJEAgJyQobWFrZS1jbWQpJyA+ICQoZG90LXRhcmdldCkuY21kO1wKIAlybSAtZiAkKGRlcGZp
bGUpCiAKK2lmZXEgKCQoZHJ5cnVuKSwxKQorY21kX2FuZF9maXhkZXAgPSAkKGNtZF9hbmRfc2F2
ZWNtZCkKK2VuZGlmCisKICMgVXNhZ2U6ICQoY2FsbCBpZl9jaGFuZ2VkX3J1bGUsZm9vKQogIyBX
aWxsIGNoZWNrIGlmICQoY21kX2Zvbykgb3IgYW55IG9mIHRoZSBwcmVyZXF1aXNpdGVzIGNoYW5n
ZWQsCiAjIGFuZCBpZiBzbyB3aWxsIGV4ZWN1dGUgJChydWxlX2ZvbykuCmRpZmYgLS1naXQgYS9z
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkIGIvc2NyaXB0cy9NYWtlZmlsZS5idWlsZAppbmRleCBhNjQ2
MWVhNDExZjcuLmNjYTAxNTMwYTg5YSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5idWls
ZAorKysgYi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkCkBAIC0yODksNiArMjg5LDcgQEAgJChvYmop
LyUubzogJChvYmopLyUuYyAkKHJlY29yZG1jb3VudF9zb3VyY2UpIEZPUkNFCiAKICMgVG8gbWFr
ZSB0aGlzIHJ1bGUgcm9idXN0IGFnYWluc3QgIkFyZ3VtZW50IGxpc3QgdG9vIGxvbmciIGVycm9y
LAogIyBlbnN1cmUgdG8gYWRkICQob2JqKS8gcHJlZml4IGJ5IGEgc2hlbGwgY29tbWFuZC4KK2Ry
eXJ1bl9jbWRfbW9kID0gJChjbWRfbW9kKQogY21kX21vZCA9IHByaW50ZiAnJXNcbicgJChjYWxs
IHJlYWwtc2VhcmNoLCAkKi5vLCAubywgLW9ianMgLXkgLW0pIHwgXAogCSQoQVdLKSAnIXhbJCQw
XSsrIHsgcHJpbnQoIiQob2JqKS8iJCQwKSB9JyA+ICRACiAKQEAgLTQ2Miw2ICs0NjMsNyBAQCAk
KHN1YmRpci1tb2RvcmRlcik6ICQob2JqKS8lL21vZHVsZXMub3JkZXI6ICQob2JqKS8lIDsKICMg
VG8gbWFrZSB0aGlzIHJ1bGUgcm9idXN0IGFnYWluc3QgIkFyZ3VtZW50IGxpc3QgdG9vIGxvbmci
IGVycm9yLAogIyByZW1vdmUgJChvYmopLyBwcmVmaXgsIGFuZCByZXN0b3JlIGl0IGJ5IGEgc2hl
bGwgY29tbWFuZC4KIAorZHJ5cnVuX2NtZF9hcl9idWlsdGluID0gJChjbWRfYXJfYnVpbHRpbikK
IHF1aWV0X2NtZF9hcl9idWlsdGluID0gQVIgICAgICAkQAogICAgICAgY21kX2FyX2J1aWx0aW4g
PSBybSAtZiAkQDsgXAogCSQoaWYgJChyZWFsLXByZXJlcXMpLCBwcmludGYgIiQob2JqKS8lcyAi
ICQocGF0c3Vic3QgJChvYmopLyUsJSwkKHJlYWwtcHJlcmVxcykpIHwgeGFyZ3MpIFwKQEAgLTQ3
Myw2ICs0NzUsNyBAQCAkKG9iaikvYnVpbHQtaW4uYTogJChyZWFsLW9iai15KSBGT1JDRQogIyBU
aGlzIGlzIGEgbGlzdCBvZiBidWlsZCBhcnRpZmFjdHMgZnJvbSB0aGUgY3VycmVudCBNYWtlZmls
ZSBhbmQgaXRzCiAjIHN1Yi1kaXJlY3Rvcmllcy4gVGhlIHRpbWVzdGFtcCBzaG91bGQgYmUgdXBk
YXRlZCB3aGVuIGFueSBvZiB0aGUgbWVtYmVyIGZpbGVzLgogCitkcnlydW5fY21kX2dlbl9vcmRl
ciA9ICQoY21kX2dlbl9vcmRlcikKIGNtZF9nZW5fb3JkZXIgPSB7ICQoZm9yZWFjaCBtLCAkKHJl
YWwtcHJlcmVxcyksIFwKIAkkKGlmICQoZmlsdGVyICUvJChub3RkaXIgJEApLCAkbSksIGNhdCAk
bSwgZWNobyAkbSk7KSA6OyB9IFwKIAk+ICRACmRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxl
Lm1vZHBvc3QgYi9zY3JpcHRzL01ha2VmaWxlLm1vZHBvc3QKaW5kZXggZDdkNDUwNjdkMDhiLi5k
Y2U2MGJmNDczZWQgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdAorKysgYi9z
Y3JpcHRzL01ha2VmaWxlLm1vZHBvc3QKQEAgLTEzMiw4ICsxMzIsOSBAQCBtb2Rwb3N0LWFyZ3Mg
Kz0gLWUgJChhZGRwcmVmaXggLWkgLCAkKEtCVUlMRF9FWFRSQV9TWU1CT0xTKSkKIAogZW5kaWYg
IyAoJChLQlVJTERfRVhUTU9EKSwpCiAKK2RyeXJ1bl9jbWRfbW9kcG9zdCA9IHRvdWNoICRAIC52
bWxpbnV4LmV4cG9ydC5jOyBzZWQgJ3MvbyQkL21vZC5jLycgbW9kdWxlcy5vcmRlciB8IHhhcmdz
IC1yIHRvdWNoCiBxdWlldF9jbWRfbW9kcG9zdCA9IE1PRFBPU1QgJEAKLSAgICAgIGNtZF9tb2Rw
b3N0ID0gXAorICAgICAgIGNtZF9tb2Rwb3N0ID0gXAogCSQoaWYgJChtaXNzaW5nLWlucHV0KSwg
XAogCQllY2hvID4mMiAiV0FSTklORzogJChtaXNzaW5nLWlucHV0KSBpcyBtaXNzaW5nLiI7IFwK
IAkJZWNobyA+JjIgIiAgICAgICAgIE1vZHVsZXMgbWF5IG5vdCBoYXZlIGRlcGVuZGVuY2llcyBv
ciBtb2R2ZXJzaW9ucy4iOyBcCmRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLnZtbGludXgg
Yi9zY3JpcHRzL01ha2VmaWxlLnZtbGludXgKaW5kZXggYjY0ODYyZGM2ZjA4Li43YzI3ZjgwNTk3
YjUgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvTWFrZWZpbGUudm1saW51eAorKysgYi9zY3JpcHRzL01h
a2VmaWxlLnZtbGludXgKQEAgLTgyLDYgKzgyLDcgQEAgZW5kaWYKIEFSQ0hfUE9TVExJTksgOj0g
JCh3aWxkY2FyZCAkKHNyY3RyZWUpL2FyY2gvJChTUkNBUkNIKS9NYWtlZmlsZS5wb3N0bGluaykK
IAogIyBGaW5hbCBsaW5rIG9mIHZtbGludXggd2l0aCBvcHRpb25hbCBhcmNoIHBhc3MgYWZ0ZXIg
ZmluYWwgbGluaworZHJ5cnVuX2NtZF9saW5rX3ZtbGludXggPSB0b3VjaCAkQCB2bWxpbnV4Lm1h
cAogY21kX2xpbmtfdm1saW51eCA9CQkJCQkJCVwKIAkkPCAiJChMRCkiICIkKEtCVUlMRF9MREZM
QUdTKSIgIiQoTERGTEFHU192bWxpbnV4KSIgIiRAIjsJXAogCSQoaWYgJChBUkNIX1BPU1RMSU5L
KSwgJChNQUtFKSAtZiAkKEFSQ0hfUE9TVExJTkspICRALCB0cnVlKQpkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9NYWtlZmlsZS52bWxpbnV4X28gYi9zY3JpcHRzL01ha2VmaWxlLnZtbGludXhfbwppbmRl
eCBiMDI0ZmZiM2UyMDEuLmRjZjZhOGMwNjcyNyAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmls
ZS52bWxpbnV4X28KKysrIGIvc2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4X28KQEAgLTU0LDYgKzU0
LDcgQEAgb2JqdG9vbC1hcmdzID0gJCh2bWxpbnV4LW9ianRvb2wtYXJncy15KSAtLWxpbmsKIAog
dm1saW51eC1vLWxkLWFyZ3MtJChDT05GSUdfQlVJTFRJTl9NT0RVTEVfUkFOR0VTKQkrPSAtTWFw
PSRALm1hcAogCitkcnlydW5fY21kX2xkX3ZtbGludXgubyA9IHRvdWNoICRAICRALm1hcAogcXVp
ZXRfY21kX2xkX3ZtbGludXgubyA9IExEICAgICAgJEAKICAgICAgIGNtZF9sZF92bWxpbnV4Lm8g
PSBcCiAJJChMRCkgJHtLQlVJTERfTERGTEFHU30gLXIgLW8gJEAgXAotLSAKMi40My4wCgo=
--0000000000006fbabb063720e3f0--

