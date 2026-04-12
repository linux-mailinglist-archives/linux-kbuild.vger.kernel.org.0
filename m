Return-Path: <linux-kbuild+bounces-12766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH/eFNm+22mTGAkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12766-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Apr 2026 17:48:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A52863E4979
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Apr 2026 17:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFEE6302001E
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Apr 2026 15:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2968929ACCD;
	Sun, 12 Apr 2026 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXZn39WK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CFE23D7DC;
	Sun, 12 Apr 2026 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008817; cv=none; b=a4ArfOWN1ilczAk4gDwlFNNO86r13fW62AhfmAsGEIWCK9UX3KtvrsaYi6XYxSwg4Qk4CzDVk89ZNWZr7ez/KfzQ8LRcYEE9tHwsJXbvzsQEYe/vk41UOVEFPK3e3fxXIxyShE9nYrW1hFzNGDSK7SGtJioI8WkUG0SVO4uHEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008817; c=relaxed/simple;
	bh=23dLLAcM76ajvHwVd9STiwBmiFsqBllnva76VnjCY0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcX/+1iVzUuR0A/+rwQzWScpt35YjvK7InmjieaApt6mo5dq5xnLe+Td8hcYs4SnooJST76WS5CRwrk+Or2ZNif6XIHPKy84gjUeYtL9L6PPw0WtcStm8HqiHhJHHju7aBY9nZuREeNRbiawU/ma8qaAtTM6WBc9duRuSqiaI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXZn39WK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADBFC19424;
	Sun, 12 Apr 2026 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776008816;
	bh=23dLLAcM76ajvHwVd9STiwBmiFsqBllnva76VnjCY0A=;
	h=Date:From:To:Cc:Subject:From;
	b=XXZn39WKLIgN3EAJkU5ENkWYZAuWvtD3iPiOn2ozgnaDOWxI5dBZ5BQmoFtFm2rE5
	 8SvYKVh+BiE2QtmOhZabXGgkkUUugDwoDYf8yxsZrEtcOf4wjIPBRyWiXDvNOmXVzB
	 tikHKggIoVLzkavDBwUeYVxmpCG98H5XVARlwPdNnSzNK1w5LM+Lxeg8tY3hNZAXBD
	 1UNYY56I3A9zV/+XMHzeoH8MDZhUK2JGiBLj7MVEywl6gQv2Fj6VG9OEJUWTyjAQji
	 OOXucRVnk+iJt7Nhg9VqjWOE/zvhkal2k4/PrKupY+JrxnbNbTlXSyxpO3xfjV1V4C
	 hOH6k+cYbW0tg==
Date: Sun, 12 Apr 2026 17:46:47 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexander Coffin <alex@cyberialabs.net>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Bill Wendling <morbo@google.com>,
	David Howells <dhowells@redhat.com>,
	Dodji Seketeli <dodji@seketeli.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
	John Moon <john@jmoon.dev>, Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Yonghong Song <yonghong.song@linux.dev>, kernel-team@fb.com,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, loongarch@lists.linux.dev
Subject: [GIT PULL] Kbuild and Kconfig changes for v7.1
Message-ID: <adu-ZyIv47FnsVLI@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Coffin <alex@cyberialabs.net>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Bill Wendling <morbo@google.com>,
	David Howells <dhowells@redhat.com>,
	Dodji Seketeli <dodji@seketeli.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
	John Moon <john@jmoon.dev>, Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Yonghong Song <yonghong.song@linux.dev>, kernel-team@fb.com,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, loongarch@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WEAPSl/ZOh7quu+7"
Content-Disposition: inline
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-12766-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[cyberialabs.net,kernel.org,arndb.de,google.com,redhat.com,seketeli.org,zytor.com,gmx.de,jmoon.dev,lwn.net,gmail.com,linuxfoundation.org,weissschuh.net,linux.dev,fb.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A52863E4979
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--WEAPSl/ZOh7quu+7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull these changes to Kbuild and Kconfig for v7.1.  Please let me
know if anything is incorrect and not matching your standards.

All changes have been in -next, most for several cycles without reported
problems.

Thanks and kind regards,
Nicolas

---

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git t=
ags/kbuild-7.1-1

for you to fetch changes up to 404927758daac5ec4594071e033c1fa6ee9ca9b6:

  kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain (202=
6-04-07 21:48:44 +0200)

----------------------------------------------------------------
Kbuild/Kconfig updates for 7.1

Kbuild changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  * tools/build: Reject unexpected values for LLVM=3D

  * kbuild: uapi: remove usage of toolchain headers

  * kbuild: Switch from '-fms-extensions' to '-fms-anonymous-structs'
    when available (currently: clang >=3D 23.0.0)

  * kbuild: Reduce the number of compiler-generated suffixes for clang
    thin-lto build

  * kbuild: reduce output spam ("GEN Makefile") when building out of tree

  * check-uapi: improve portability for testing headers

  * uapi: also test UAPI headers against C++ compilers

  * kbuild: vdso_install: drop build ID architecture allow-list

  * checksyscalls: only run when necessary

  * Documentation: kbuild: Update the debug information notes in
    reproducible-builds.rst

  * kconfig: forbid multiple entries with the same symbol in a choice

  * kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain


Kconfig changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  * kconfig: Error out on duplicated kconfig inclusion


Cc: Alexander Coffin <alex@cyberialabs.net>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bill Wendling <morbo@google.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Dodji Seketeli <dodji@seketeli.org>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Helge Deller <deller@gmx.de>
Cc: John Moon <john@jmoon.dev>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Song Liu <song@kernel.org>
Cc: Thomas Wei=DFschuh <linux@weissschuh.net>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: kernel-team@fb.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev
Cc: loongarch@lists.linux.dev

----------------------------------------------------------------
Arnd Bergmann (3):
      check-uapi: link into shared objects
      check-uapi: honor ${CROSS_COMPILE} setting
      check-uapi: use dummy libc includes

Justin Stitt (1):
      kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain

Masahiro Yamada (1):
      kconfig: forbid multiple entries with the same symbol in a choice

Nathan Chancellor (3):
      kbuild: Consolidate C dialect options
      kbuild: Use '-fms-anonymous-structs' if it is available
      Documentation: kbuild: Update the debug information notes in reproduc=
ible-builds.rst

Nicolas Schier (1):
      kconfig: Error out on duplicated kconfig inclusion

Thomas Wei=DFschuh (25):
      Documentation/llvm: drop note about LLVM=3D0
      tools/build: Reject unexpected values for LLVM=3D
      hexagon: uapi: Fix structure alignment attribute
      kbuild: uapi: test linux/bpf_perf_event.h on powerpc
      kbuild: uapi: deduplicate linux/bpf_perf_event.h exclusions
      kbuild: uapi: completely exclude linux/bpf_perf_event.h on nios2
      kbuild: uapi: only use dummy-include for headers which use libc
      kbuild: uapi: provide stub includes for some libc headers
      kbuild: uapi: use custom stub headers instead of libc ones
      kbuild: uapi: simplify libc dependency logic
      kbuild: uapi: remove now unneeded guard headers
      kbuild: reduce output spam when building out of tree
      kbuild: uapi: move some compiler arguments out of the command definit=
ion
      kbuild: uapi: move all include path flags together
      kbuild: uapi: handle UML in architecture-specific exclusion lists
      kbuild: uapi: provide a C++ compatible dummy definition of NULL
      kbuild: uapi: also test UAPI headers against C++ compilers
      kbuild: vdso_install: split out the readelf invocation
      kbuild: vdso_install: hide readelf warnings
      kbuild: vdso_install: gracefully handle images without build ID
      kbuild: vdso_install: drop build ID architecture allow-list
      checksyscalls: move path to reference table to a variable
      checksyscalls: fail on all intermediate errors
      checksyscalls: only run when necessary
      checksyscalls: move instance functionality into generic code

Yonghong Song (1):
      kbuild: Reduce the number of compiler-generated suffixes for clang th=
in-lto build

 Documentation/kbuild/llvm.rst                      |  4 --
 Documentation/kbuild/reproducible-builds.rst       |  7 ++-
 Kbuild                                             | 14 +++--
 Makefile                                           | 35 +++++++++---
 arch/arm64/kernel/vdso32/Makefile                  |  3 +-
 arch/hexagon/include/uapi/asm/sigcontext.h         |  2 +-
 arch/loongarch/vdso/Makefile                       |  2 +-
 arch/mips/Makefile                                 |  6 +-
 arch/parisc/boot/compressed/Makefile               |  2 +-
 arch/powerpc/boot/Makefile                         |  3 +-
 arch/s390/Makefile                                 |  3 +-
 arch/s390/purgatory/Makefile                       |  3 +-
 arch/x86/Makefile                                  |  6 +-
 arch/x86/boot/compressed/Makefile                  |  6 +-
 drivers/firmware/efi/libstub/Makefile              |  3 +-
 init/Kconfig                                       |  5 ++
 scripts/Makefile.vdsoinst                          |  7 ++-
 scripts/Makefile.warn                              |  5 --
 scripts/check-uapi.sh                              | 19 ++++---
 scripts/checksyscalls.sh                           | 11 +++-
 scripts/kconfig/lexer.l                            |  4 +-
 scripts/kconfig/lkc.h                              |  3 +-
 scripts/kconfig/parser.y                           | 15 ++---
 scripts/kconfig/tests/err_repeated_inc/Kconfig     |  3 +
 .../kconfig/tests/err_repeated_inc/Kconfig.inc1    |  4 ++
 .../kconfig/tests/err_repeated_inc/Kconfig.inc2    |  3 +
 .../kconfig/tests/err_repeated_inc/Kconfig.inc3    |  1 +
 scripts/kconfig/tests/err_repeated_inc/__init__.py | 10 ++++
 .../kconfig/tests/err_repeated_inc/expected_stderr |  2 +
 scripts/kconfig/util.c                             | 31 ++++++++++-
 tools/scripts/Makefile.include                     |  2 +
 usr/dummy-include/endian.h                         |  0
 usr/dummy-include/limits.h                         |  8 +++
 usr/dummy-include/netinet/if_ether.h               |  0
 usr/dummy-include/netinet/in.h                     |  0
 usr/dummy-include/stdbool.h                        |  7 ---
 usr/dummy-include/stddef.h                         | 13 +++++
 usr/dummy-include/stdint.h                         | 17 ++++++
 usr/dummy-include/stdlib.h                         |  7 ---
 usr/dummy-include/string.h                         | 12 ++++
 usr/dummy-include/sys/ioctl.h                      |  0
 usr/dummy-include/sys/socket.h                     | 12 ++++
 usr/dummy-include/sys/time.h                       |  3 +
 usr/dummy-include/sys/types.h                      |  0
 usr/dummy-include/time.h                           |  0
 usr/dummy-include/unistd.h                         |  0
 usr/include/Makefile                               | 65 ++++++++++++++----=
----
 47 files changed, 251 insertions(+), 117 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/Kconfig
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/Kconfig.inc1
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/Kconfig.inc2
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/Kconfig.inc3
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/__init__.py
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/expected_stderr
 create mode 100644 usr/dummy-include/endian.h
 create mode 100644 usr/dummy-include/limits.h
 create mode 100644 usr/dummy-include/netinet/if_ether.h
 create mode 100644 usr/dummy-include/netinet/in.h
 delete mode 100644 usr/dummy-include/stdbool.h
 create mode 100644 usr/dummy-include/stddef.h
 create mode 100644 usr/dummy-include/stdint.h
 delete mode 100644 usr/dummy-include/stdlib.h
 create mode 100644 usr/dummy-include/string.h
 create mode 100644 usr/dummy-include/sys/ioctl.h
 create mode 100644 usr/dummy-include/sys/socket.h
 create mode 100644 usr/dummy-include/sys/time.h
 create mode 100644 usr/dummy-include/sys/types.h
 create mode 100644 usr/dummy-include/time.h
 create mode 100644 usr/dummy-include/unistd.h

--=20
Nicolas

--WEAPSl/ZOh7quu+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmnbvloACgkQB1IKcBYm
EmnVJBAAlJvaCwNlI1ymaWQKEC+s4udzUKo5DuA14pw/3NgGhLasok1WZaWB0LUb
2D4NtXMeQLTFybnTE07rbHZwQ/fBpvyWNL0D9aL+bjHfYhkbJHIJIgnrTOJLn3IW
wJuPJgJDMvgmWKyXGRLjPEevSmKF10Aej8f0QIsXuv8IG8M0ZfpIohRV35Dot9w6
kRQC6lX0lYTfaBzp7IBMtY634rtzC9rHK+U1gkkvswuE2H26rm5TxeE1lL6Xecmf
pd16FUspWGCMMB6YFRz3hi4ZRIMhY3MgY6LvvcHNF0RDrdoEoqWFyKLd/l5X5CNq
HKbIrMJ4l5E4KCSw3rtaW/RzmcZjDtU1RLdXLomAhZU7sszIhyYOuptBVAncdKVC
Vo+lxm1kLlBRG4eQjCnA51HQZN7VbO54XSvWVmRioEUevu6wSA8UvSq7Kcufzg57
I9nn9kpwFqJZvQsNGIdDqEgIT5l3muX1Y89E723OqKZ9CoPl2meGrLQU69e4gGFc
R/nTDktzEFINZHVk72AwAWyjvE/IGx6mmogf1+4Zz7MK2Q5aeXejy6T5aZ0QMwtH
/290TxOxWlOqi3b57Quo0xJVltkA9WxCi++4hh0Te/x2Yjaqbaovui7fBjqeKvCh
Oh9AhNVYbTOjIMS2CyL6xQBlr+Vp2MQ163tqds1uSP3IqrS2T+8=
=WfCJ
-----END PGP SIGNATURE-----

--WEAPSl/ZOh7quu+7--

