Return-Path: <linux-kbuild+bounces-9922-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFEAC98131
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 16:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABEC93A366D
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 15:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7F13321C4;
	Mon,  1 Dec 2025 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMgVtRww"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C585E3321AB;
	Mon,  1 Dec 2025 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603471; cv=none; b=Zoz8URjNP4lz5D6og5SJXAI1XAjqD8T0TuBGdxVMYOLQAuZvE/70SC8DHk46p6tAKMfsb341wCAudyPgqiGwEFrvLDlQTOfGmEPshIxurhovIyHS6c7fWCQcsGs/rjg3IjVmCOgsU1rMsvHDftOXG3UgYX+b1Ci82hYVdFUD4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603471; c=relaxed/simple;
	bh=awUTRTYRGaLiiA9acpIPZAJNdxWgH4jwSBoltIcAfH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F3QDkcOv2ACM+kO6mKojbuP4Mm+xOhEAB3HkLSFe4pirXhkp28qWdYC4xPnlLwXKuN4g71q84WS/slde+b4Q7QPh2GuKCulDf/2mK4VOnszfCoJKQpBIeSAO6LhAfT4CKxqeM2uWKpATWwhb8JXm7sr3bidvUSof6nOqrhFUHAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMgVtRww; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD7FC4CEF1;
	Mon,  1 Dec 2025 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764603471;
	bh=awUTRTYRGaLiiA9acpIPZAJNdxWgH4jwSBoltIcAfH0=;
	h=Date:From:To:Cc:Subject:From;
	b=BMgVtRwwGY72+uUV4/BPmYEhSjTDu1yr1IvMTtMhRW09D2jqJFg7SeWcuE7jvvZZX
	 ilmaeEtq1uu7IGrMgEleUZ0G1rc6sIeBjvr9f1dayhCXkpJk7RDOBfjU0Gx8O6hzBe
	 hGw5RdUK0yNJRQWDEZiuwX/QdZtUvfax1TbRe72U+1d33ghz1E1gqcMB8zw1/OICXV
	 QhpHc198CJfPVFOdF+w5pVlYKPRFIOCpzmhGX63pRNZFQEC1C2idN/dzku/BB6kexA
	 i0JdK2dVYtCdLztcOvgA22UrD91y3xbhF8NxQgBw3isXbokKEmgFHvxNxiz01dIxmQ
	 qbfr8IEZFs+Ig==
Date: Mon, 1 Dec 2025 16:37:38 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] kbuild changes for v6.19
Message-ID: <aS22QhwdrHN24ToD@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQBt54GaISGqDieK"
Content-Disposition: inline


--qQBt54GaISGqDieK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull these update to Kbuild for v6.19.  This is my first pull
request, so please let me know if anything is incorrect and not matching
your standards.

All changes have been in -next, most for several cycles without reported
problems.

Non-native kbuild changes are related to addition of -fms-extensions and
a conversion example; as well as for the userspace CC_CAN_LINK addition.

Thanks and kind regards,
Nicolas


----------------------------------------------------------------

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git t=
ags/kbuild-6.19-1

for you to fetch changes up to 2a9c8c0b59d366acabb8f891e84569376f3e2709:

  kbuild: add target to build a cpio containing modules (2025-11-26 21:56:1=
4 +0100)

----------------------------------------------------------------
Kbuild updates for v6.19

  - Enable -fms-extensions, allowing anonymous use of tagged struct or
    union in struct/union (tag kbuild-ms-extensions-6.19).  An exemplary
    conversion patch is added here, too (btrfs).

  - Introduce architecture-specific CC_CAN_LINK and flags for userprogs

  - Add new packaging target 'modules-cpio-pkg' for building a initramfs
    cpio w/ kmods

  - Handle included .c files in gen_compile_commands

  - Minor kbuild changes:
    - Use objtree for module signing key path, fixing oot kmod signing
    - Improve documentation of KBUILD_BUILD_TIMESTAMP
    - Reuse KBUILD_USERCFLAGS for UAPI, instead of defining twice
    - Rename scripts/Makefile.extrawarn to Makefile.warn
    - Drop obsolete types.h check from headers_check.pl
    - Remove outdated config leak ignore entries

Signed-off-by: Nicolas Schier <nsc@kernel.org>

----------------------------------------------------------------
Ahmad Fatoum (1):
      initramfs: add gen_init_cpio to hostprogs unconditionally

Gang Yan (1):
      kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation

Mikhail Malyshev (1):
      kbuild: Use objtree for module signing key path

Nathan Chancellor (4):
      jfs: Rename _inline to avoid conflict with clang's '-fms-extensions'
      kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS
      kbuild: Rename Makefile.extrawarn to Makefile.warn
      kbuild: uapi: Drop types.h check from headers_check.pl

Nicolas Schier (3):
      Merge tag 'kbuild-ms-extensions-6.19' into kbuild-next
      MAINTAINERS, .mailmap: Update mail address for Nicolas Schier
      scripts: headers_install.sh: Remove two outdated config leak ignore e=
ntries

Pat Somaru (1):
      scripts/clang-tools: Handle included .c files in gen_compile_commands

Rasmus Villemoes (2):
      Kbuild: enable -fms-extensions
      btrfs: send: make use of -fms-extensions for defining struct fs_path

Sascha Hauer (1):
      kbuild: add target to build a cpio containing modules

Thomas Wei=DFschuh (4):
      kbuild: uapi: reuse KBUILD_USERCFLAGS
      kbuild: don't enable CC_CAN_LINK if the dummy program generates warni=
ngs
      init: deduplicate cc-can-link.sh invocations
      kbuild: allow architectures to override CC_CAN_LINK

 .mailmap                                      |   4 +-
 Documentation/kbuild/kbuild.rst               |  10 +-
 MAINTAINERS                                   |   2 +-
 Makefile                                      |  18 +++-
 arch/arm64/kernel/vdso32/Makefile             |   3 +-
 arch/loongarch/vdso/Makefile                  |   2 +-
 arch/parisc/boot/compressed/Makefile          |   2 +-
 arch/powerpc/boot/Makefile                    |   3 +-
 arch/s390/Makefile                            |   3 +-
 arch/s390/purgatory/Makefile                  |   3 +-
 arch/x86/Makefile                             |   4 +-
 arch/x86/boot/compressed/Makefile             |   7 +-
 drivers/firmware/efi/libstub/Makefile         |   4 +-
 drivers/gpu/drm/Makefile                      |   2 +-
 fs/btrfs/send.c                               |  39 ++++----
 fs/jfs/jfs_incore.h                           |   6 +-
 init/Kconfig                                  |   8 +-
 scripts/Kconfig.include                       |   3 +
 scripts/Makefile.modinst                      |   2 +-
 scripts/Makefile.package                      |  20 ++++
 scripts/{Makefile.extrawarn =3D> Makefile.warn} |   4 +-
 scripts/cc-can-link.sh                        |   2 +-
 scripts/clang-tools/gen_compile_commands.py   | 135 ++++++++++++++++++++++=
++--
 scripts/headers_install.sh                    |   2 -
 usr/Makefile                                  |   4 +-
 usr/include/Makefile                          |  11 +--
 usr/include/headers_check.pl                  |  63 ------------
 27 files changed, 236 insertions(+), 130 deletions(-)
 rename scripts/{Makefile.extrawarn =3D> Makefile.warn} (98%)

--qQBt54GaISGqDieK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmkttkIACgkQB1IKcBYm
EmmTexAAk4tdTzr41SYNnA3mMkrcMqKXBUHroUIY8t2ZA2SLS6sOFkelD78laaIR
SiQY4QO0AL1vudAF01dwy88H8ydjJye9VfVp3wr5boZbyrX0fkaR0VmCFJKQBezx
Nj0zQ/qVNLgltXYIlZtwykpIsLfsGbxDP9uKwxio6OT5tuy8jtOGsN4kHuKYP18r
ub/mz+KwPj+QPLD/F7KhltmW8j0bRAmG5mqr6iCq2+D5kzXx/eea/Fb2p08AFiZC
2LisF6+xYZoKTdpoP57uZo5Jd+jVflSweDibbfqnKvweDgcbvBa0tabau0l/ZPAU
ryNgYrW6b9UdKKlwzzbI3D9/LjgwPAGXiC1OBe82P539lsMkSQixxtjH13uDysfF
HOkWLDBooPtebFZIXn/RNk/Ow4QScRW7DhfKMFhpRdH6tXLIc9sxduoVW5zY2tCl
oCy535gfQMVWrlMPUHbMggp1FlXkZjOEvKzwZcR6MwTWcSW00D18R/wFELS6QQE8
lwerDiRa+J/1jp3Kv06cVcw3sTNcvVaOUb8e0ADQV2qYrzk6R6mVLQlC+YSmv9/N
gtobu61J+ZfcRucsNFX1lyBNrj0uYbxXzgn6wd+dDi1Qld0Q5SCaXoc2QhpX6/+h
SbjQKxCPv4QAfHYwdhTitxsisHIu00rIu3IzG8d4LaRkiYrqbkY=
=04W+
-----END PGP SIGNATURE-----

--qQBt54GaISGqDieK--

