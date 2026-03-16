Return-Path: <linux-kbuild+bounces-11960-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBFdO9MouGnhZgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11960-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 16:59:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E229CE03
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 16:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4811F30612BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 15:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D3D3B7B82;
	Mon, 16 Mar 2026 15:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l62nS8bj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEBB3B8D5F;
	Mon, 16 Mar 2026 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676446; cv=none; b=R31fvlMrSQsYZ2P2yROtWneOS4CGIdglgE5bTcB3/vraSqV1b+Deu8EBu1tRg8lw2dsSlCkKp7vR5T6KqPPuVFn30JIuBPEBtDuWdRoNf3+Cw/9wDdWsMDBQCF26TAfUWM+yxdQpgsqE8le5TGAmCkYO+HKkLtUKpkmoOhgi1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676446; c=relaxed/simple;
	bh=Fl4yHBIFk1UNeJbI0tTKMD0o4Xvj+34JP7razIWIE1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=np0mKAkunnNHU7i3eBvlzl8OYrAzbYhWjyfMa5KDWyCIJaByEb993TfCZSGTQCwK/0GilcXBSEHcDz9nZZnMupbYKCWThiXaz8XGlhMrz1KpmJbU1vq/+aj8y/j4XXXbvPesSzISv0qxec3/OR4Ye/iQfbP0ygIH1W3veqfL7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l62nS8bj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A820C19425;
	Mon, 16 Mar 2026 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773676445;
	bh=Fl4yHBIFk1UNeJbI0tTKMD0o4Xvj+34JP7razIWIE1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l62nS8bj40q2xeaX1bY/bjkAs1HEHzV1jmVJVz9jY2QpBatlBff1h2zgn1OoICy6g
	 MOyj7JGLTd1CeoKSQELtFrS9RUFs0yipLVoFXKa3r6xbeA4t0jr0Uk1jfCdish7/zz
	 7ZjPqQha29UXFay2YQoQNRasr/QqiC4etLkXdAwBZkFZYWFftXzPZpw9xSFij+Opsl
	 JWpKM3aW8Oq06rB5d5ozNKm++87NmR1KKqFoxn1+UrIcZ0hIYKqw/VQI6O/YV/4d0s
	 xJGnfRuhX6olhVIjn3TdYB1ljTAlHjo7jfyd4mf+Q2ILQuCEM0gzc8Sm+Jg58ra+wj
	 aCpVvgFw/xk1w==
Date: Mon, 16 Mar 2026 16:52:28 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, nathan@kernel.org,
	masahiroy@kernel.org, kees@kernel.org, naveen@kernel.org,
	jpoimboe@kernel.org, peterz@infradead.org, npiggin@gmail.com,
	maddy@linux.ibm.com, segher@kernel.crashing.org,
	christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au
Subject: Re: [RFC PATCH v4 5/6] kbuild: Add objtool integration for PowerPC
 feature fixups
Message-ID: <abgnPNNygOs6EnQc@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Sathvika Vasireddy <sv@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
	naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
	npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
	christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au
References: <20260316062237.30948-1-sv@linux.ibm.com>
 <20260316062237.30948-6-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XN8fyNDuwfLB4hL6"
Content-Disposition: inline
In-Reply-To: <20260316062237.30948-6-sv@linux.ibm.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11960-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D9E229CE03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--XN8fyNDuwfLB4hL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 11:52:36AM +0530, Sathvika Vasireddy wrote:
> Add build system support for PowerPC feature fixup processing:
>=20
> - Add HAVE_OBJTOOL_FTR_FIXUP config option for architectures that support
>   build-time feature fixup processing
> - Integrate objtool feature fixup processing into vmlinux build
>=20
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  Makefile                 | 7 +++++++
>  scripts/Makefile.lib     | 4 ++--
>  scripts/Makefile.vmlinux | 3 ++-
>  3 files changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 83ed80595378..861f5bec655c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1467,6 +1467,13 @@ ifdef CONFIG_OBJTOOL
>  prepare: tools/objtool
>  endif
> =20
> +# CONFIG_OBJTOOL and CONFIG_HAVE_OBJTOOL_FTR_FIXUP are unrelated, separa=
te
> +# options. It was integrated in objtool in order to borrow the elf parse=
r,
> +# but this is different from how the other objtool commands are used.
> +ifdef CONFIG_HAVE_OBJTOOL_FTR_FIXUP
> +prepare: tools/objtool
> +endif
> +
>  ifdef CONFIG_BPF
>  ifdef CONFIG_DEBUG_INFO_BTF
>  prepare: tools/bpf/resolve_btfids
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index e429d68b8594..c9478c717574 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -179,10 +179,10 @@ cpp_flags      =3D -Wp,-MMD,$(depfile) $(NOSTDINC_F=
LAGS) $(LINUXINCLUDE)     \
> =20
>  ld_flags       =3D $(KBUILD_LDFLAGS) $(ldflags-y) $(LDFLAGS_$(@F))
> =20
> -ifdef CONFIG_OBJTOOL
> -
>  objtool :=3D $(objtree)/tools/objtool/objtool
> =20
> +ifdef CONFIG_OBJTOOL
> +
>  objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+=3D --hacks=3Djump_label
>  objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+=3D --hacks=3Dnoinstr
>  objtool-args-$(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)	+=3D --hacks=3Dsky=
lake
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index fcae1e432d9a..a1bef0638ecb 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -65,7 +65,8 @@ ARCH_POSTLINK :=3D $(wildcard $(srctree)/arch/$(SRCARCH=
)/Makefile.postlink)
>  # Final link of vmlinux with optional arch pass after final link
>  cmd_link_vmlinux =3D							\
>  	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
> -	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
> +	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true);	\
> +	$(if $(CONFIG_HAVE_OBJTOOL_FTR_FIXUP), $(objtool) --ftr-fixup --link $@=
, true)
> =20
>  targets +=3D vmlinux.unstripped .vmlinux.export.o
>  vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o =
$(KBUILD_LDS) FORCE
> --=20
> 2.43.0
>=20

Acked-by: Nicolas Schier <nsc@kernel.org>  # kbuild

--XN8fyNDuwfLB4hL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmm4JzsACgkQB1IKcBYm
EmksSRAAxbcvBBJQN6MUo+acdze5tyvjE+Lwjg0qXNwJqlf341oGEXmIXFIdjdxL
G7iNJtPjYRSWI8RTnRqQuY2URyCr6X5MDMyIMOpPdqlcQ/ug7YeShTtVj/Rd4NY+
8FybJRTumZ1MYPoRgd45gNZcbsNJDg7vs9W6l5OAGaUkr+49S1f4luVI7q6R4CQI
kAPzyebw3LDhnliiNT45mnCHD3bCSg6p49YQ62DdVbSsGLJ6pdLWLOaybh+FPNyP
Xd+ymWx1JC61cJSPjp3gYEMeRbCsfXL6+A2ne3ZPiu8xT32kDu7ko2aSqlPNfLUW
1QtJN28ndG2C8VCgQpqktae2aKpi1ai1HOpDUy/kAvl2IdffCxRoiUHHTHGxlatZ
OAgQyfgYubnsvfQEUG7O8ewd+w8PIlE0155927+lUBXKpjX33wA0e9dTqFK70WAv
UXffgk+fSqd2iOushlZ4nrj6tUgapyjwrQTu2/m6lD/4+PMGyYi4M6aRuazaw8f/
5H4HkYut3RjALkZMgocsSCPofBR+joz3JkAKXcOeSltTrQUGM9FVMDnHe2PWMIXU
M4Es+mUg75uhPvBzQKgVLMXumOAqK/kclqMHIdfVXqMY/FJlkFElBQVbMhKS6BSQ
AbqfPfjhRkJYwBtcAwVg4HuGm4ctdBtDd2gpaklBFS0qrGZVjL0=
=rQsT
-----END PGP SIGNATURE-----

--XN8fyNDuwfLB4hL6--

