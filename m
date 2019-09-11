Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE0DAFBF3
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2019 13:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfIKLyA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 07:54:00 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57034 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726198AbfIKLyA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 07:54:00 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1i81C5-0001Zl-C6; Wed, 11 Sep 2019 12:53:53 +0100
Date:   Wed, 11 Sep 2019 12:53:53 +0100
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, ab@php.net
Message-ID: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jrfbxnaojb54d47b"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        shadbolt.decadent.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RELAYS autolearn=disabled
        version=3.4.2
Subject: [PATCH] Documentation: kbuild: Add document about reproducible builds
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on shadbolt.decadent.org.uk)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--jrfbxnaojb54d47b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In the Distribution Kernels track at Linux Plumbers Conference there
was some discussion around the difficulty of making kernel builds
reproducible.

This is a solved problem, but the solutions don't appear to be
documented in one place.  This document lists the issues I know about
and the settings needed to ensure reproducibility.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 Documentation/kbuild/index.rst               |   1 +
 Documentation/kbuild/reproducible-builds.rst | 115 +++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 Documentation/kbuild/reproducible-builds.rst

diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index e323a3f2cc81..0f144fad99a6 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -18,6 +18,7 @@ Kernel Build System
     headers_install
=20
     issues
+    reproducible-builds
=20
 .. only::  subproject and html
=20
diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/k=
build/reproducible-builds.rst
new file mode 100644
index 000000000000..4d988faf93b8
--- /dev/null
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -0,0 +1,115 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Reproducible builds
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+It is generally desirable that the building the same source code with
+the same set of tools is reproducible, i.e. the output is always
+exactly the same.  This makes it possible to verify that the build
+infrastructure for a binary distribution or embedded system has not
+been subverted.  This can also make it easier to verify that a source
+or tool change does not make any difference to the resulting binaries.
+
+The `Reproducible Builds project`_ has more information about this
+general topic.  This document covers the various reasons why building
+the kernel may be unreproducible, and how to avoid them.
+
+Timestamps
+----------
+
+The kernel embeds a timestamp in two places:
+
+* The version string exposed by ``uname()`` and included in
+  ``/proc/version``
+
+* File timestamps in the embedded initramfs
+
+By default the timestamp is the current time.  This must be overridden
+using the `KBUILD_BUILD_TIMESTAMP`_ variable.  If you are building
+from a git commit, you could use its commit date.
+
+The kernel does *not* use the ``__DATE__`` and ``__TIME__`` macros,
+and enables warnings if they are used.  If you incorporate external
+code that does use these, you must override the timestamp they
+correspond to by setting the `SOURCE_DATE_EPOCH`_ environment
+variable.
+
+User, host
+----------
+
+The kernel embeds the building user and host names in
+``/proc/version``.  These must be overridden using the
+`KBUILD_BUILD_USER and KBUILD_BUILD_HOST`_ variables.  If you are
+building from a git commit, you could use its committer address.
+
+Absolute filenames
+------------------
+
+When the kernel is built out-of-tree, debug information may include
+absolute filenames for the source files.  The ``__FILE__`` macro may
+also expand to an absolute filename.  This must be overridden by
+including `prefix-map options`_ in the `KCFLAGS`_ variable.
+
+Generated files in source packages
+----------------------------------
+
+The build processes for some programs under the ``tools/``
+subdirectory do not completely support out-of-tree builds.  This may
+cause source packages built using e.g. ``make rpm-pkg`` to include
+generated files and so be unreproducible.  It may be necessary to
+clean the source tree completely (``make mrproper`` or
+``git clean -d -f -x``) before building a source package.
+
+Module signing
+--------------
+
+If you enable ``CONFIG_MODULE_SIG_ALL``, the default behaviour is to
+generate a different temporary key for each build, resulting in the
+modules being unreproducible.  However, including a signing key with
+your source would presumably defeat the purpose of signing modules.
+
+One approach to this is to divide up the build process so that the
+unreproducible parts can be treated as sources:
+
+1. Generate a persistent signing key.  Add the certificate for the key
+   to the kernel source.
+
+2. Set the ``CONFIG_SYSTEM_TRUSTED_KEYS`` symbol to include the
+   signing key's certificate, set ``CONFIG_MODULE_SIG_KEY`` to an
+   empty string, and disable ``CONFIG_MODULE_SIG_ALL``.
+   Build the kernel and modules.
+
+3. Create detached signatures for the modules, and publish them as
+   sources.
+
+4. Perform a second build that attaches the module signatures.  It
+   can either rebuild the modules or use the output of step 2.
+
+Structure randomisation
+-----------------------
+
+If you enable ``CONFIG_GCC_PLUGIN_RANDSTRUCT``, you will need to
+pre-generate the random seed in
+``scripts/gcc-plgins/randomize_layout_seed.h`` so the same value
+is used in rebuilds.
+
+Debug info conflicts
+--------------------
+
+This is not a problem of unreproducibility, but of generated files
+being *too* reproducible.
+
+Once you set all the necessary variables for a reproducible build, a
+vDSO's debug information may be identical even for different kernel
+versions.  This can result in file conflicts between debug information
+packages for the different kernel versions.
+
+To avoid this, you can make the vDSO different for different
+kernel versions by including an arbitrary string of "salt" in it.
+This is specified by the Kconfig symbol ``CONFIG_BUILD_SALT``.
+
+.. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
+.. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user=
-kbuild-build-host
+.. _KCFLAGS: kbuild.html#kcflags
+.. _prefix-map options: https://reproducible-builds.org/docs/build-path/
+.. _Reproducible Builds project: https://reproducible-builds.org/
+.. _SOURCE_DATE_EPOCH: https://reproducible-builds.org/docs/source-date-ep=
och/

--jrfbxnaojb54d47b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl144EwACgkQ57/I7JWG
EQmwKw//Ym+tojduxq9Ie0jzHFNkKgj6kSzYEo+XxOg5gwl6RTP7MxBmVn2yvJHa
eV+mpt6lafiWCiDa8AXV9HwavgNJUrp99Mb5YL/uHn3bFsaObKDLG4c6fPUSDMM2
kO+lu7gZ2Hez7SHrNCqNYNUSIJvyMh+Kqf/eJQhLLGxZvXZ0CgG98nr8j5W9knZG
mvUYj+2IK1Wp/kf0Sra0HSkw9vf21XOcTyErXWJyv8Za8qA1J54TiOhJP1kCLR+4
6pRVPnrMZzJL0WffdrrhfAUp5MHSNKrOWXqvzGU69A0Jq3iVTNWs0fAIvpteZpv+
Gg48iS/4863BUr/oU3Xwzp4pneO6ACd16NmQugcgr8P4N60M243V9YXSkL1GzYJY
vGUbNZhCeiMkgJkxH1aE1YtKrgYwoAVMhoxBHwRp10+vMM8o5PZUVHLveOogq89p
7BjZAoo61cxhIFmC830YFss+GszxPbAe1nrwHNn8hc9bdznJaQJ9n4IE3nmIhuLc
6kLrPXn72GSGt80uJS/EQzyxpaz1QRVY1qIdAaGswlZQOVbKWyrAehkT+uBOFLNx
hIgSd+JW4ZxzceQRBNtOYJU8FPwt3NiBn7bZBLxWxxoU1w5rWkhczIi5rTQbw0sy
168gzt61l8EFX0juoFsqJ5wWrXwFj9Oro4fOb7UVegIz3eOY4Mc=
=Ne42
-----END PGP SIGNATURE-----

--jrfbxnaojb54d47b--
