Return-Path: <linux-kbuild+bounces-11955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECPLAYUJuGkWYQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11955-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 14:45:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18F29AAE9
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 14:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 533493055602
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 13:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC3E39A04C;
	Mon, 16 Mar 2026 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBHLwNXQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D039A04A;
	Mon, 16 Mar 2026 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668442; cv=none; b=MPldSOQvIW0byB8qSoBvxQusEQ5VLr08Tc/dxFW6LM6fEvkA5Lg01kpLdJTXDf2eOSTBgtPDw5MZBahwpM13TB0S4g4Xk7f00PALgXZAGTfv1Mcl3ti2BkqwdPa0Wnjcx3PWZZYTvPpMrQBoP75zyNnqyLfYj1+lfkbM33G9jQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668442; c=relaxed/simple;
	bh=0xTxDT0xeRLRDn1/97+bZ4KoB/Z0tHh7d+AWsRqC2wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wa4B4tRrAcKcheuMrBsnDQtO+zqkl96GoeGsOXZ4X0ZxTJWpupeiW6tN5JelqZAaWgewO7SlrVQBsbhcWcqF41yMghlUq8YzMa+c+oigInrxfdxEmG9jDqmLG2zC4uTp8YsHOZBbZr1AYz7ZbBEeEl1tWJNuiDUZtytRg6xWFaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBHLwNXQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C4AC19421;
	Mon, 16 Mar 2026 13:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668442;
	bh=0xTxDT0xeRLRDn1/97+bZ4KoB/Z0tHh7d+AWsRqC2wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBHLwNXQbs2F8DNXTpPHny6U3eI9vxUx24AOiZ73rm/CrAHsABVRjLik0R5Py2aFi
	 oBvRz+OC8VT0xMczNnEYechlE1B3RZ3pQlNVnJniZL7O14p5VAJsY8unFMudVDyamI
	 M+XXDrlh25JhuXAyWFyrS2DAGh8igmP5ngO5JnWJofUF1uBLeFCoKzjipUpmGC/CSC
	 nblE9TbGYCtqzW5qi5g1Vf4FSKFc/1/k02TJO6H93eRtsb0ILhDQ5n+VooOS8SVhL0
	 SuoaLTAT/s60rRFIdpO76KpTePScrKU2vCInkHeo4TxuRNlSccEe5dvCAAuO3nyY/D
	 AHOEaqMMpRJuA==
Date: Mon, 16 Mar 2026 14:33:17 +0100
From: Nicolas Schier <nsc@kernel.org>
To: xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to
 scripts/Makefile.vmlinux_a
Message-ID: <abgGnfO5ZrpOUza7@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>, xur@google.com,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20251028182822.3210436-1-xur@google.com>
 <20251028182822.3210436-2-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3LIPWUU5r6vqSeC4"
Content-Disposition: inline
In-Reply-To: <20251028182822.3210436-2-xur@google.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11955-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F18F29AAE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3LIPWUU5r6vqSeC4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 06:28:21PM +0000, xur@google.com wrote:
> From: Rong Xu <xur@google.com>
>=20
> From: Masahiro Yamada <masahiroy@kernel.org>
>=20
> Move the build rule for vmlinux.a to a separate file in preparation
> for supporting distributed builds with Clang ThinLTO.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: Rong Xu <xur@google.com>
> ---
>  Makefile                   | 16 +++++--------
>  scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+), 10 deletions(-)
>  create mode 100644 scripts/Makefile.vmlinux_a
>=20
> diff --git a/Makefile b/Makefile
> index b34a1f4c03967..89a25bac2bbab 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1198,7 +1198,7 @@ export ARCH_DRIVERS	:=3D $(drivers-y) $(drivers-m)
>  KBUILD_VMLINUX_OBJS :=3D built-in.a $(patsubst %/, %/lib.a, $(filter %/,=
 $(libs-y)))
>  KBUILD_VMLINUX_LIBS :=3D $(filter-out %/, $(libs-y))
> =20
> -export KBUILD_VMLINUX_LIBS
> +export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
>  export KBUILD_LDS          :=3D arch/$(SRCARCH)/kernel/vmlinux.lds
> =20
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> @@ -1207,16 +1207,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
>  KBUILD_MODULES :=3D y
>  endif
> =20
> -# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <=3D 14
> -quiet_cmd_ar_vmlinux.a =3D AR      $@
> -      cmd_ar_vmlinux.a =3D \
> -	rm -f $@; \
> -	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(s=
rctree)/scripts/head-object-list.txt)
> +PHONY +=3D vmlinux_a
> +vmlinux_a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
> +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_a
> =20
> -targets +=3D vmlinux.a
> -vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
> -	$(call if_changed,ar_vmlinux.a)
> +vmlinux.a: vmlinux_a
> +	@:
> =20
>  PHONY +=3D vmlinux_o
>  vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
> diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
> new file mode 100644
> index 0000000000000..9774f02b43b2f
> --- /dev/null
> +++ b/scripts/Makefile.vmlinux_a
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +PHONY :=3D __default
> +__default: vmlinux.a
> +
> +include include/config/auto.conf
> +include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
> +
> +# Link of built-in-fixup.a
> +# ----------------------------------------------------------------------=
-----
> +
> +# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <=3D 14
> +quiet_cmd_ar_builtin_fixup =3D AR      $@
> +      cmd_ar_builtin_fixup =3D \
> +	rm -f $@; \
> +	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
> +	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F =
-f $(srctree)/scripts/head-object-list.txt)

Venkat Rao Bagalkote <venkat88@linux.ibm.com> reported [1] that this
breaks builds on system with binutils < 2.38.
Documentation/process/changes.rst state binutils 2.30 as build
dependency; binutils 2.38 has been released in 02/2022.

I removed the patch set from kbuild-next-unstable and kbuild-for-next
for now.

The simpliest solution would be to declare binutils 2.38 as build
dependency; but I am afraid that it is still "too new", right now.

Can someone elaborate a bit on the comment about --thin and "the bug of
llvm-ar <=3D 14'?

May it be an option to introduce $(ar-option) macro?
Something like this? (untested)

ar-option =3D $(call try-run, \
		( trap 'rm -f $(tmp-target).ar-option' EXIT INT HUP QUIT; \
		  $(AR) cr $(1) $(tmp-target).ar-option ),$(1),$(2) )
AR_THIN =3D $(call ar-option, --thin)

=2E..

	$(AR) cDPrS $(AR_THIN) $@ $(KBUILD_VMLINUX_OBJS); \
	$(AR) mPi $(AR_THIN) $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F=
 -f $(srctree)/scripts/head-object-list.txt)


Kind regards,
Nicolas


[1]: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c1ecae82=
d@linux.ibm.com

--3LIPWUU5r6vqSeC4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmm4BpgACgkQB1IKcBYm
EmmoHA/8CI0dGKaduIbY1RzoF59sKLCivn2ONplDPchC6PDPiqcpzuYj1IinAxo2
KLru6c8Gc/Pq21in4d64WM05CN5jeljjX7W/SJ230VWzbDHqjkt+mgA3reuLi12I
k30mnIQKwn9FNA/7m6TRFH9RadO0OaKUConmEwDdWg718hQoLm01pufr97XyGh2I
SUjS1MbPUq96lQMo0CyR3RkdIG5T0CkMKHfoyNBm2m2kR3iynenSL2GIliZqP1V0
k2vblZUs0iS8aDvbdv5FhMWdnVel4jv+3v4MLkfiwj2X3WQJJP4PsP1GtDViQNDe
IwNSgOPwT97AieSyohzkmj3uNBIYTv+htJC0ZsheoDzuKNCU6oZVhZFiJPy0LJZU
I2/Mf2HccFPfw5nITg3Rp15Z2nnU0EXeKrC3qQI7XgoQZParV0YUa/DknRf+IhNA
UZcLL8C+W//N5VcIbyK4GVnRvoatvEC3PnyrsI3ZbNK0NIC8yt9PtMqpd9dz1Ijq
IQw/J9P1IdwuZpBYWyl3ZSZiHYdNYznsyhI7M3Tg20cuDNU2yFHG+8mzhQpLmZHE
bz1UKhiP5M/8KBMHZJQNA/ktnSQw4LfVibaR3TWbipvb7NnLKZnNlYLDSdT0qeKi
L1VAW8Ty+FJxMkUDFd3nGEEn/JKxIFJHG7zy1sbvY8hH3C3/sz0=
=JAXb
-----END PGP SIGNATURE-----

--3LIPWUU5r6vqSeC4--

