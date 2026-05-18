Return-Path: <linux-kbuild+bounces-13257-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHzNBvQ6C2qWEwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13257-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 18:14:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC6570AE3
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 18:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1761530207E5
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 16:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D0A49253E;
	Mon, 18 May 2026 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5hgS7T4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7A3F9F58;
	Mon, 18 May 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120668; cv=none; b=FoYiyx3MuJTw+x6Fy5m0WSZSlgazF6A95pCCtTUl9mJGEuK1LBwGnknuTTqTx/bf71jfldmnCkvneMTAiPpKve/yK/bjTb6yQI6uS6LxFxMFqeS/J9siZcqppEqO827vptcApttfMYInsURmPgivQkXFXDUA6+Ju89tl6My+0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120668; c=relaxed/simple;
	bh=WdWOMa8kUavgAfkD9iUmwcHvoFMafQT5ULptg68l7Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=toFOo+Kd5LJ5zpFmkagTxrUIvWGjQhQpLpD0+4WX0/CIubbefUtaRpgk5bOC18sp0EMMbZNfht+dDvIMsAJYqN5/THiqGv2u8YKXUzFssWnTWSVn+pibGikUDQg4smVJsO5Y0xvP/4JkhZ6AFWe67WrYd3YUq9OxKXH1mZeG7pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5hgS7T4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A8CC2BCB8;
	Mon, 18 May 2026 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779120666;
	bh=WdWOMa8kUavgAfkD9iUmwcHvoFMafQT5ULptg68l7Xc=;
	h=Date:From:To:Cc:Subject:From;
	b=t5hgS7T4mBGhvLLVzpKHw6PNipnfXcRFJDqtUTPJ10xjWQr6vaWQsGvFYzq0hMKxn
	 DgEdgbqvID7uy33KFJwEob+brHxpepVBosW4vjAX/CX48wgDE0On8oJR4mjeDCWu9E
	 Bt2DT05df4+iKFsyj5ktsvnihMAw6/h1a8jNjLPx37+umwcJI40pGdriwu9fUHYQxU
	 JzjcZOEXX6GXHWniDgP4PNjWDyppVRhDVXoh5u7iQnavuUASRd4gUPkmAGkb5ZyMm7
	 PA9htgjYtApru5yxuNHIkkeV3uZIcAcfGMYtZck6n+gBzLf40WqhyA9KFaMNlJ5GUP
	 9PyBtJv7S9d0w==
Date: Mon, 18 May 2026 17:11:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>, Sasha Levin <sashal@kernel.org>
Subject: linux-next: manual merge of the kbuild tree with the origin tree
Message-ID: <ags6FtowWAeGPoEN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dvmBoIotjlIpEIuE"
Content-Disposition: inline
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-13257-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6FCC6570AE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--dvmBoIotjlIpEIuE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  scripts/Makefile.modfinal

between commit:

  dc1f85a9637cc ("kallsyms: extend lineinfo to loadable modules")

=66rom the origin tree and commit:

  7abef41afad05 ("kbuild/btf: Remove broken module relinking exclusion")

=66rom the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/Makefile.modfinal
index 3941cf624526b,01a37ec872b90..0000000000000
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@@ -46,25 -46,11 +46,17 @@@ quiet_cmd_btf_ko =3D BTF [M] $
  		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vml=
inux $@; \
  	fi;
 =20
 +quiet_cmd_lineinfo_ko =3D LINEINFO [M] $@
 +      cmd_lineinfo_ko =3D $(CONFIG_SHELL) $(srctree)/scripts/gen-mod-line=
info.sh $@
 +
- # Same as newer-prereqs, but allows to exclude specified extra dependenci=
es
- newer_prereqs_except =3D $(filter-out $(PHONY) $(1),$?)
-=20
- # Same as if_changed, but allows to exclude specified extra dependencies
- if_changed_except =3D $(if $(call newer_prereqs_except,$(2))$(cmd-check),=
      \
- 	$(cmd);                                                              \
- 	printf '%s\n' 'savedcmd_$@ :=3D $(make-cmd)' > $(dot-target).cmd, @:)
-=20
  # Re-generate module BTFs if either module's .ko or vmlinux changed
  %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(=
CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
- 	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
+ 	+$(call if_changed,ld_ko_o)
  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 +endif
 +ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
 +	+$(if $(newer-prereqs),$(call cmd,lineinfo_ko))
  endif
  	+$(call cmd,check_tracepoint)
 =20

--dvmBoIotjlIpEIuE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLOhUACgkQJNaLcl1U
h9D7DggAha1muqnMsFC82bYSqTsCHelpd1X6cazeN/9/EfM52+OUylmj/hBIyV/+
a/f0YXfWviIDOOccxLa2GY2PbLf9t34oDgAYzGcsBrrMWsc0P13rTLS/WHPV8slY
doGNIxvGetMeJevxEMWkg5z3AN+acNZ3pF9Et0iWq7RIgOLVnk1dxGQV6Ot6lJP/
/eRMVQEl0PHz6xBLaerQxxbRjzKD6kjbyObM7/e/ZtJ5Pb48bKAxJhVYtFkTWTq+
B/K+Rtb2kJs9umnEFlv2AuqCra5LjBUH/8z5ui3xlMcUiZdindpstyIdBfHR7GVZ
Qa07lioziTV2pDG4JlxSJpogUQl/cQ==
=5LsX
-----END PGP SIGNATURE-----

--dvmBoIotjlIpEIuE--

