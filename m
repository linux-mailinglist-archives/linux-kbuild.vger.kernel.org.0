Return-Path: <linux-kbuild+bounces-11145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9SZmDUg/jWnR0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11145-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:47:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD551294E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1F293017797
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953A61DE4F1;
	Thu, 12 Feb 2026 02:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="pUVgIPTV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F668460;
	Thu, 12 Feb 2026 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864450; cv=none; b=iGldWJL9h5T7erklkHEvHyC9yByqSXrpaWfH4R/6ok20+gbnOhs9E+Ihkkvxh6+eIGsQjJs6IHU5sopevkCH2HBsnwKF00WkuZtBbepLrXP1FnyU9nWu2VeFKW6WcpFnbzzDCmUbE+onhi0XXRVy6LUd3kGVn5j+mty1InOxn64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864450; c=relaxed/simple;
	bh=rSnQEnbRZuXIU1w2dGBxkvbzrwwYMsGFoY6PXL1QjRE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kFlf3dVESd3CH5tSeEORNqhseRgrdNii8eTS7QA84FsJUWPHvw8ZsnuSfr9bgzGkX0/2XgmNyRKraCcMZdUBz7WNt008c1N+f2I3Tb57MUg8qyMD5Ney4Hoj3nhqU3nUoP/SzPxS3O6dAk4basRZN8v0eKi8/wFKs8PGKu16ia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=pUVgIPTV; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864447; x=1802400447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+1fc+MfJhkM/YcgWU5lldhaZDeggtKccIIHRs/4XnBE=;
  b=pUVgIPTV7MQU5k1c1QoikB14M5WJf7oOHOO5JnpC2y0DH6v65sjeX7KC
   wtNCCgWK7Q0hw3WRu6OE9BBpjMeS/e+FkxvoAeCF/kUjgJ4lfdSVc1nDX
   XQtu2WHy9X2jTbbN2xH7ICjjP07CDVtCwgS000NipxrM3+nWSVL/FlSzA
   tdyfnSz8PAOXo+oHfvU7rdrh3OP0kFLH/NrlkoXjnZVDLSgae5fD8kfBz
   K0sKaGCjfKC8fbzXeUUJD7iKXQWKrnp872ZVNXTZXj+71EP0SAkLnbCZc
   e4uBSlDESVSzF0dMM6X97Tndle77BYoXU7X1m4s/Rx/nVxCGfHr5cru5/
   g==;
X-CSE-ConnectionGUID: CrYdtFeeRCeB7520RpsYUA==
X-CSE-MsgGUID: Q8lV7ql4SJizqvw3JLqbGA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918534"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:47:27 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:20410]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 606542a2-d18c-48f0-af55-9f68f08f7fbf; Thu, 12 Feb 2026 02:47:27 +0000 (UTC)
X-Farcaster-Flow-ID: 606542a2-d18c-48f0-af55-9f68f08f7fbf
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:47:26 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:47:26 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH v1 00/106] crypto: Standalone crypto module (Series 2/4): Arch-independent crypto
Date: Thu, 12 Feb 2026 02:45:36 +0000
Message-ID: <20260212024725.11264-1-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D037UWC002.ant.amazon.com (10.13.139.250) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.66 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11145-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[android.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AD551294E8
X-Rspamd-Action: no action

This patch series is a follow up of Series 1/4:
https://lore.kernel.org/all/20260212024228.6267-1-wanjay@amazon.com/

This feature is organized into four patch series for submission to the mainline (up to the "Merge tag 'landlock-7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux"):
- Patch Series 1/4: "[PATCH v1 0...17] crypto: Standalone crypto module (Series 1/4): Core implementation"
- Patch Series 2/4: "[PATCH v1 0...106] crypto: Standalone crypto module (Series 2/4): Arch-independent crypto"
- Patch Series 3/4: "[PATCH v1 0...21] crypto: Standalone crypto module (Series 3/4): x86_64 crypto"
- Patch Series 4/4: "[PATCH v1 0...12] crypto: Standalone crypto module (Series 4/4): arm64 crypto"

The full source code is available at https://github.com/amazonlinux/linux/tree/fips-kernel-module.
Details on this feature and what each patch series covers can be found below.

## 1. Introduction

Amazon Linux is releasing a new kernel feature that converts the previously built-in kernel crypto subsystem into a standalone kernel module. This module becomes the carrier of the kernel crypto subsystem and can be loaded at early boot to provide the same functionality as the original built-in crypto. The primary motivation for this modularization is to streamline Federal Information Processing Standards (FIPS) validation, a critical cryptographic certification for cloud computing users doing business with the U.S. government.
 
In a bit more detail, previously, FIPS certification was tied to the entire kernel image, meaning non-crypto updates could potentially invalidate certification. With this feature, FIPS certification is tied only to the crypto module. Therefore, once the module is certified, loading this certified module on newer kernels automatically makes those kernels FIPS-certified. As a result, this approach can save re-certification costs and 12-18 months of waiting time by reducing the need for repeated FIPS re-certification cycles.

This feature is organized into four patch series:
- Patch Series 1 - Core feature implementation
- Patch Series 2 - Architecture-independent crypto: Modularize built-in crypto under `crypto/`
- Patch Series 3 - x86_64 crypto: Modularize built-in crypto under `arch/x86/crypto/`
- Patch Series 4 - arm64 crypto: Modularize built-in crypto under `arch/arm64/crypto/`

This document provides technical details on how this feature is designed and implemented for users or developers who are interested in developing upon it, and is organized as follows:
- Section 2 - Getting Started: Quick start on how to enable the feature
- Section 3 - Workflow Overview: Changes this feature brings to build and runtime
- Section 4 - Design Implementation Details: Technical deep-dive into each component
- Section 5 - Customizing and Extending Crypto Module: How to select crypto to be included and extend to new crypto/architectures
- Section 6 - Related Work and Comparison
- Section 7 - Summary

## 2. Getting Started

This section provides a quick start guide for developers on how to enable, compile and use the standalone cryptography module feature.

### 2.1 Basic Configuration

The feature is controlled by a single configuration option:
```
CONFIG_CRYPTO_FIPS140_EXTMOD=y
```
What it does: When enabled, automatically redirects a set of cryptographic algorithms from the main kernel into a standalone module `crypto/fips140/fips140.ko`. The cryptographic algorithms that are redirected need to satisfy all the following conditions, otherwise the cryptography will remain in its original form:
1. Must be configured as built-in (i.e., `CONFIG_CRYPTO_*=y`). This means cryptography already configured as modular (i.e., `CONFIG_CRYPTO_*=m`) are not redirected as they are already modularized.
2. Must be among a list, which can be customized by developers as described in Section 5.

When disabled, the kernel behaves as before.

### 2.2 Build Process

Once `CONFIG_CRYPTO_FIPS140_EXTMOD=y` is set, no additional steps are required. The standalone module will be built automatically as part of the standard kernel build process:
```
make -j$(nproc)
# or
make vmlinux
```
**What happens automatically (No user action required):**
1. Build the module as `crypto/fips140/fips140.ko`
2. The cryptography module will be loaded at boot time
3. All kernel cryptographic services will provide the same functionality as before (i.e., prior to introducing this new feature) once boot completes.

### 2.3 Advanced Configuration Options

**Using External Cryptography Module:**
```
CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE=y
```
By default, `CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE` is not set, meaning the freshly built cryptography module is used. Otherwise, the pre-built standalone cryptography module from `fips140_build/crypto/fips140/fips140.ko` and modular cryptography such as `fips140_build/crypto/aes.ko` (need to manually place pre-built modules in these locations before the build) are included in kernel packaging (e.g., during `make modules_install`) and are used at later boot time.

**Dual Version Support:**
```
CONFIG_CRYPTO_FIPS140_DUAL_VERSION=y
```
Encapsulate two versions of `fips140.ko` into kernel: one is freshly built for non-FIPS mode usage, another is pre-built specified by `fips140_build/crypto/fips140/fips140.ko` for FIPS mode usage. The appropriate version is selected and loaded at boot time based on boot time FIPS mode status.

### 2.4 Verification

To verify the feature is working, after install and boot with the new kernel:
```
# Check if fips140.ko module is loaded
lsmod | grep fips140
```

## 3. Workflow Overview

This section provides an overview without delving into deep technical details of the changes the standalone cryptography module feature introduces. When this feature is enabled, it introduces changes to both the kernel build and booting process. 

3.1 Build-Time Changes

Kernel cryptography subsystem consists of both cryptography management infrastructure (e.g., `crypto/api.c`, `crypto/algapi.c`, etc), along with hundreds of different cryptography algorithms (e.g., `crypto/arc4.c`).

**Traditional Build Process:**
Traditionally, cryptography management infrastructure are always built-in to the kernel, while cryptographic algorithms can be configured to be built either as built-in (`CONFIG_CRYPTO_*=y`) or as separate modular (`CONFIG_CRYPTO_*=m`) `.ko` file depending on kernel configuration:
As a result, the builtin cryptography management infrastructure and cryptographic algorithms are statically linked into the kernel binary:
```
cryptographic algorithms source files → compiled as .o objfiles →  linked into vmlinux → single kernel binary
```
**With Standalone Cryptography Module:**
This feature automatically transforms the builtin cryptographic components into a standalone cryptography module, `fips140.ko`. To do so, it develops a new kernel build rule `crypto-objs-$(CONFIG_CRYPTO_*)` such that, once this build rule is applied to a cryptographic algorithm, such cryptographic algorithm will be automatically collected into the cryptography module if it is configured as built-in (i.e, `CONFIG_CRYPTO_*=y`), for example:
```
// in crypto/asymmetric_keys/Makefile
- obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
+ crypto-objs-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
```
Such build change allows the modularization transformation to only affect selected cryptographic algorithms (i.e, where the `crypto-objs-$(CONFIG_CRYPTO_*`) is applied).

Then, after the `fips140.ko` is generated, it will be embedded back into main kernel vmlinux as a replacement part. The purpose of this embedding, instead of traditionally putting the `fips140.ko` into filesystem, is a preparation to allow the module to be loaded early enough even before the filesystem is ready.

The new build process is illustrated below.
```
cryptographic algorithms source files → compiled as .o objfiles → automatically collected and linked into fips140.ko → embedded fips140.ko into vmlinux as a replaceable binary
```

### 3.2 Runtime Changes

**Traditional Boot Process:**
The kernel initializes the cryptographic subsystem early during boot, executing each cryptographic initialization routine accordingly. These initialization routines may depend on other cryptographic components or other kernel subsystems, so their invocation follows a well-defined execution order to ensure they are initialized before their first use.
```
kernel starts → cryptography subsystem initialization → cryptography subsystem available → other components use cryptography
```
**With Standalone Cryptography Module:**
At the start of kernel boot, compared to a regular kernel, the first major change introduced by this feature is that no cryptography services are initially available — since the entire cryptography subsystem has been decoupled from the main kernel.
To ensure that the cryptography subsystem becomes available early enough (before the first kernel component that requires cryptography services), the standalone cryptography kernel module must be loaded at a very early stage, even before the filesystem becomes available.

However, the regular module loading mechanism relies on placing kernel modules in the filesystem and loading them from there, which creates a chicken-and-egg problem — the cryptography module cannot be loaded until the filesystem is ready, yet some kernel components may require cryptography services even before that point.

To address this, the second change introduced by this feature is that the cryptography kernel module is loaded directly from memory, leveraging the earlier compilation changes that embed the module binary into the main kernel image. Afterward, the feature includes a “plug-in” mechanism that connects the decoupled cryptography subsystem back to the main kernel, ensuring that kernel cryptography users can correctly locate and invoke the cryptography routine entry points.

Finally, to ensure proper initialization, the feature guarantees that all cryptography algorithms and the cryptography management infra execute their initialization routines in the exact same order as they would if they were built-in.

The process described above is illustrated below.
```
kernel starts → no cryptography available → load fips140.ko from memory → plug cryptography back to kernel → module initialization → cryptographic services available → other components use cryptography
```

## 4. Design Implementation Details

While the earlier sections provide a holistic view of how this feature shapes the kernel, this section provides deeper design details on how these functionalities are realized. There are three key design components:
1. A specialized compile rule that automatically compiles and collects all built-in cryptographic algorithm object files to generate the final module binary under arbitrary kernel configurations, and then embeds the generated binary into the main kernel image for early loading.
2. A mechanism to convert interactions between the cryptography subsystem and the main kernel into a pluggable interface.
3. A module loading and initialization process that ensures the cryptography subsystem is properly initialized as if it were built-in.

### 4.1. Specialized Compilation System

**Automatic Collection and Linking of Built-in Cryptographic Algorithm Objects:**
The first step in generating the `fips140.ko` module is to compile and collect built-in cryptographic components (i.e., those specified by `CONFIG_CRYPTO_*=y`).
Traditionally, the existing module build process requires all module components (e.g., source files) to reside in a single directory. However, this approach is not suitable for our case, where hundreds of cryptographic algorithm source files are scattered across multiple directories.

A naïve approach would be to create a separate Makefile that duplicates the original build rules with adjusted paths.
However, this method is not scalable due to the large number of cryptographic build rules, many of which are highly customized and can vary under different Kconfig settings, making such a separate Makefile even more complex.
Moreover, this approach cannot ensure that built-in cryptographic algorithms are completely removed from the main kernel, which would result in redundant cryptographic code being included in both the kernel and the module.

To tackle this challenge, we automated the object collection and linking process by introducing special build logic for the kernel cryptography subsystem.
Specifically, to automatically collect cryptography object files while preserving their original compilation settings (such as flags, headers, and paths), we introduced a new compilation rule:
```
crypto-objs-y += *.o
```
This replaces the original `obj-y += *.o` rule in cryptography Makefiles later, for example:
```
// in crypto/asymmetric_keys/Makefile
- obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
+ crypto-objs-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
asymmetric_keys-y := \    asymmetric_type.o \    restrict.o \    signature.o
```
in the cryptography subsystem Makefiles, allowing most of the existing Makefile logic to be reused.
As a result, when the standalone cryptography module feature is enabled, any cryptographic algorithm configured as built-in (for example, `crypto-objs-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o` where `CONFIG_ASYMMETRIC_KEY_TYPE=y`) will be automatically collected and linked into a single final object binary, `fips140.o`.
During this process, a special compilation flag (`-DFIPS_MODULE=1`) is applied to instruct each object file to be compiled in a module-specific manner. This flag will later be used to generate the pluggable interface on both the main kernel side and the module side from the same source code.

The implementation details are as follows: it follows a similar methodology used by the `obj-y` collection process for building `vmlinux.o`. The `crypto-objs-y` rule is placed in `scripts/Makefile.build`, which is executed by each directory Makefile to collect the corresponding crypto object files. Each directory then creates a `crypto-module.a` archive that contains all `crypto-objs-y += <object>.o` files under that directory. In the parent directories, these `crypto-module.a` archives are recursively included into the parent’s own `crypto-module.a`, and this process continues upward until the final `fips140.o` is generated.

**A Separate Module Generation Pipeline for Building the Final Kernel Module from Linked Cryptographic Algorithm Object:**
With the linked cryptographic algorithm object (i.e., `fips140.o`), the next step is to generate the final kernel module, `fips140.ko`.

A direct approach would be to inject the `fips140.ko` module build into the existing modules generation pipeline (i.e., `make modules`) by providing our pre-generated `fips140.o`. However, we choose not to do this because it would create a circular make rule dependency (which is invalid in Makefiles and causes build failures), resulting in mutual dependencies between the modules and vmlinux targets (i.e., `modules:vmlinux` and `vmlinux:modules` at the same time).
This happens for the following reasons:
1. Since we will later embed `fips140.ko` into the final kernel image (as described in the next section), we must make vmlinux depend on `fips140.ko`. In other words: `vmlinux: fips140.ko`.
2. When the kernel is built with `CONFIG_DEBUG_INFO_BTF_MODULES=y`, it requires: modules: vmlinux. This is because `CONFIG_DEBUG_INFO_BTF_MODULES=y` takes vmlinux as input to generate BTF info for the module, and inserts such info into the `.ko` module by default.
3. If we choose to inject `fips140.ko` into make modules, this would create a make rule dependency: `fips140.ko: modules`. Combined with items 1 and 2, this eventually creates an invalid circular dependency between vmlinux and modules.

Due to these reasons, the design choice is to use a separate make pipeline (defined as `fips140-ready` in the Makefile). This new pipeline reuses the same module generation scripts used by make modules but adds additional logic in `scripts/Makefile.{modfinal|modinst|modpost}` and `scripts/mod/modpost.c` to handle module symbol generation and verification correctly. 

**A Seamless Process That Embeds the Generated Binary Into the Main Kernel Image for Early Loading:**
As mentioned earlier, in order to load the standalone cryptography module early in the boot process—before the filesystem is ready—the module binary must be embedded into the final kernel image (i.e., vmlinux) so that it can be loaded directly from memory.
We intend for this embedding process to be completely seamless and automatically triggered whenever vmlinux is built (i.e., during `make vmlinux`).

To achieve this, the feature adds a Make dependency rule so that vmlinux depends on `fips140.ko`.
It also modifies the vmlinux link rules (i.e., `arch/<arch>/kernel/vmlinux.lds.S`, `scripts/Makefile.vmlinux`, and `scripts/link-vmlinux.sh`) so that the generated module binary is finally combined with `vmlinux.o`.

In addition, we allow multiple cryptography module binary versions (for example, a certified cryptography binary and a latest, up-to-date but uncertified one) to be embedded into the main kernel image to serve different user needs. This design allows regular (non-FIPS) users to benefit from the latest cryptographic updates, while FIPS-mode users continue to use the certified cryptography module.

To support this, we introduce an optional configuration, `CONFIG_CRYPTO_FIPS140_DUAL_VERSION`. When enabled, this option allows two cryptography module versions to be embedded within a single kernel build and ensures that the appropriate module is selected and loaded at boot time based on the system’s FIPS mode status.

### 4.2. Pluggable Interface Between the Built-in Cryptography Subsystem and the Main Kernel

Although the module binary (`fips140.ko`) has been embedded into the final kernel image (`vmlinux`) as described in the previous section, it is not linked to the kernel in any way. This is because `fips140.ko` is embedded in a data-only manner, so the main kernel cannot directly call any functions or access any data defined in the module binary.

Even worse, simply removing the built-in cryptographic algorithms without additional handling would cause the kernel to fail to compile, because traditionally, built-in cryptographic algorithms and the main kernel can interact only through functions and variables whose addresses they assume to know. As a result, even if they have been removed, kernel cryptography users still expect the symbol addresses of cryptographic routines and data to be available at compile time.

To address this, we introduce a pluggable interface between built-in cryptographic functions and variables by placing **address placeholders**. During runtime, once the cryptography kernel module is loaded, these placeholders are updated to the correct addresses. In the rest of this section, we first introduce this pluggable interface mechanism, and then explain how to apply it to the built-in cryptographic algorithms.

**The Pluggable Interface Mechanism:**
There are two types of address holders used to achieve this pluggable interface:
- Function addresses:  We use the “static call” mechanism. Static calls are a Linux mechanism that converts an “indirect call” into something with performance equivalent to a “direct call,” while avoiding the introduction of additional security concerns, such as control-flow–hijacking attack gadgets. We implement this function-address placeholder as the `DECLARE_STATIC_CALL()` and `DEFINE_CRYPTO_API_STUB()` wrappers.
- Variable addresses (the remaining smaller portion): For these, we use a pointer of the corresponding data type. We implement this address placeholder as the `DECLARE_CRYPTO_VAR()` and `DEFINE_CRYPTO_API_STUB()` wrappers:

These wrappers are applied to each symbol-exported (i.e., `EXPORT_SYMBOL()`) cryptographic function and variable (details on how to apply them are described later). Once applied, the wrappers are compiled differently for the main kernel and for the built-in cryptographic algorithm source code—acting as the “outlet” and the “plug,” respectively—using different compilation flags (`-DFIPS_MODULE`) introduced by our customized build rules described earlier.

As a result, the kernel can successfully compile even when the built-in cryptographic algorithms are removed, thanks to these address placeholders. At boot time, the placeholders initially hold NULL, but since no cryptography users exist at that stage, the kernel can still start booting correctly. After the cryptography module is loaded, the placeholders are dynamically updated to the correct addresses later (by `do_crypto_api()` and `do_crypto_var()`, described in later section).

In addition to these address placeholders, there is another important interaction point between the cryptography subsystem and the main kernel—the cryptographic initialization routines. Therefore, we also add a mechanism to collect all cryptographic initialization functions (e.g., those defined using `module_init()`) into a dedicated ELF section. This serves as preparation for the later module and cryptography-subsystem initialization steps described in subsequent sections.

**Applying the Pluggable Interface Mechanism to Cryptographic Algorithms:**

To apply these pluggable interface wrappers to a cryptographic algorithm and make them take effect, we follow the steps below (using `crypto/asymmetric_keys/asymmetric_type.c` as an example):
1. **Apply `crypto-objs-y` compile rule to the cryptographic algorithm:**
```
// in crypto/asymmetric_keys/Makefile
- obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
+ crypto-objs-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
asymmetric_keys-y := \    asymmetric_type.o \    restrict.o \    signature.o
```
2. **Locate the communication point between the cryptographic algorithm and the main kernel:**

The cryptography subsystem is designed such that most interactions between the main kernel and cryptographic algorithms occur through exported symbols using `EXPORT_SYMBOL()` wrappers.
This kernel design exists because most cryptographic algorithm implementations must support both built-in and modular modes. 

Consequently, the cryptographic functions and variables exported by `EXPORT_SYMBOL()` are a well-defined and identifiable interface between the cryptography subsystem and the main kernel: 
```
// in crypto/asymmetric_keys/asymmetric_type.c 
//Exported cryptographic function:
bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
                const struct asymmetric_key_id *kid2) {...}
EXPORT_SYMBOL_GPL(asymmetric_key_id_same); 
//Exported cryptographic variable:
struct key_type key_type_asymmetric = {...};
EXPORT_SYMBOL_GPL(key_type_asymmetric); 
```
3. **Replace their declarations in the header file with the address-placeholder declaration wrappers:**
```
// in include/keys/asymmetric-type.h
// for exported cryptographic function:
- bool asymmetric_key_id_same const struct asymmetric_key_id *kid1, const struct asymmetric_key_id *kid2);
+ DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, asymmetric_key_id_same, bool,
    (const struct asymmetric_key_id *kid1, const struct asymmetric_key_id *kid2),
    (kid1, kid2)); 
// for exported cryptographic variables:
- struct key_type key_type_asymmetric;
+ DECLARE_CRYPTO_VAR(CONFIG_ASYMMETRIC_KEY_TYPE, key_type_asymmetric, struct key_type, );
+ #if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_ASYMMETRIC_KEY_TYPE)
+ #define key_type_asymmetric (*((struct key_type*)CRYPTO_VAR_NAME(key_type_asymmetric)))
+ #endif 
```
By replacing the original declarations with the address-placeholder declaration wrappers, we can automatically force all cryptography users to go through the placeholders, because those users already include the same header file.
The wrapper also takes the cryptographic algorithm Kconfig symbol as a parameter, so that when a cryptographic algorithm is built as a module (for example, `CONFIG_ASYMMETRIC_KEY_TYPE=m`), the original function declarations remain unchanged and are not affected.

4. **Add the address-placeholder definition wrappers into a dedicated file `fips140-api.c`:**

This file will be compiled separately and acts as both the “outlet” and the “plug” for the main kernel and the cryptography module, respectively:
```
// in crypto/fips140/fips140-api.c
+ #if IS_BUILTIN(CONFIG_ASYMMETRIC_KEY_TYPE)
+ #include <keys/asymmetric-type.h>
// for exported cryptographic function:
+ DEFINE_CRYPTO_API_STUB(asymmetric_key_id_same);
// for exported cryptographic variables:
+ #undef key_type_asymmetric
+ DEFINE_CRYPTO_VAR_STUB(key_type_asymmetric);
+ #endif
```

5. **Lastly, collect the cryptographic initialization routines for later module and cryptography-subsystem initialization by wrapping the original cryptographic initialization functions:**
```
// in crypto/asymmetric_keys/asymmetric_type.c 
- module_init(asymmetric_key_init);
- module_exit(asymmetric_key_cleanup); 
+ crypto_module_init(asymmetric_key_init);
+ crypto_module_exit(asymmetric_key_cleanup); 
```
We apply the above steps to both architecture-independent and architecture-specific cryptographic algorithms.

### 4.3. Initialization Synchronization

To ensure the embedded `fips140.ko` module binary provides the same cryptography functionality as the regular kernel, the kernel needs:
1. A module loader to load the module binary directly from memory,
2. A mechanism to plug the module back into the kernel by updating the address placeholders, and
3. Correct cryptography subsystem initialization, as if the cryptographic algorithms were still built-in.

**Directly Load Module Binary from Memory:**
Regular modules are loaded from the filesystem and undergo signature verification on the module binary, which relies on cryptographic operations. However, since we have already fully decoupled the cryptography subsystem, we must skip this step for this `fips140.ko` module.
To achieve this, we add a new loader function `load_crypto_module_mem()` that can load the module binary directly from memory at the designed address without checking the signature. Since the module binary is embedded into main kernel in an ELF section, as specified in the linker script:
```
// in arch/<arch>/kernel/vmlinux.lds.S
    .fips140_embedded : AT(ADDR(.fips140_embedded) - LOAD_OFFSET) {
        . = ALIGN(8);
        _binary_fips140_ko_start = .;
        KEEP(*(.fips140_module_data))
        _binary_fips140_ko_end = .;
    }
```
Therefore, the runtime memory address of the module can be accessed directly by the module loader to invoke the new loader function `load_crypto_module_mem()`.

**Plug Back the Module by Updating Address Placeholder Values:**
To update the address placeholders in the main kernel to the correct addresses matching the loaded module, after compilation the placeholders are placed into dedicated ELF sections `_crypto_api_keys` and `_crypto_var_keys`.
This can be seen from the definition of the placeholder-declaration wrappers:
```
#define DEFINE_CRYPTO_API_STUB(name) \    static struct crypto_api_key __##name##_key \        __used \        __section("__crypto_api_keys")  // Place in a dedicated ELF Section
        __aligned(__alignof__(struct crypto_api_key)) = \    { \        .key = &STATIC_CALL_KEY(crypto_##name##_key), \        .tramp = STATIC_CALL_TRAMP_ADDR(crypto_##name##_key), \        .func = &name, \    };

#define DEFINE_CRYPTO_VAR_STUB(name) \    static struct crypto_var_key __crypto_##name##_var_key \        __used \        __section("__crypto_var_keys")  // Place in a dedicated ELF Section
        __aligned(__alignof__(struct crypto_var_key)) = \    { \        .ptr = &CRYPTO_VAR_NAME(name), \        .var = (void*)&name, \    };
```
The purpose of doing this is to allow the main kernel to quickly locate the placeholders and update them to the correct addresses. The update functions are defined as `do_crypto_var()` and `do_crypto_api()`, which are executed at module load.

As a result, all cryptography users in the main kernel can now call the cryptographic functions as if they were built-in.

**Initialize Cryptography Subsystem as if it Were Built-in:**
Cryptographic components must be properly initialized before use, and this initialization is typically achieved through dedicated initialization functions (e.g., `module_init(crypto_init_func)` or `late_initcall(crypto_init_func)`). These functions often have strict execution order requirements and must run during the appropriate boot phase.

Therefore, for our standalone cryptography module feature, we must ensure that these decoupled “built-in” cryptographic algorithms are properly initialized and that their initialization order is preserved as before because failure to follow the correct order can result in kernel panic.

To address this, we introduce a synchronization mechanism between the main kernel and the module to ensure all cryptographic algorithms are executed in the correct kernel boot phase. In more details, we spawn the module initialization process `fips_loader_init()` as an async thread `fips140_sync_thread()`, in which we call `run_initcalls()` to execute the initialization calls of each cryptographic algorithm.
Then, we introduce synchronization helpers such as `wait_until_fips140_level_sync(int level)` to ensure the initialization order of all cryptographic algorithms is synchronized with the main kernel.

## 5. Customization and Extension of Cryptography Module

This section describes how developers can customize which cryptographic algorithms are included in the standalone cryptography module, as well as extend this feature to other cryptographic algorithms or hardware architectures.

### 5.1. Cryptography Selection Mechanism

The feature automatically includes cryptographic algorithms that meet specific criteria:
1. **Built-in Configuration**: Only cryptographic algorithms configured as `CONFIG_CRYPTO_*=y` are candidates for inclusion
2. **Explicit Inclusion**: Cryptographic algorithms must be explicitly converted using the `crypto-objs-$(CONFIG__CRYPTO_*`) build rule

### 5.2. Extend Support to New Cryptographic Algorithms

To extend support to a new cryptographic algorithm in the standalone module, follow these steps:

**Step 1: Update the Makefile**
```
# in crypto/[algorithm]/Makefile
- obj-$(CONFIG_CRYPTO_ALGORITHM) += algorithm.o
+ crypto-objs-$(CONFIG_CRYPTO_ALGORITHM) += algorithm.o
```
For Architecture-Specific Cryptographic Algorithms:
- Apply the `crypto-objs-` rule in the appropriate `arch/*/crypto/Makefile`

**Step 2: Add Pluggable Interface Support**
If the cryptographic algorithm exports symbols via `EXPORT_SYMBOL()`, add the pluggable interface wrappers:
```
# Example: in include/crypto/algorithm.h
- extern int crypto_algorithm_transform(struct crypto_tfm *tfm, const u8 *src, 
                                       u8 *dst, unsigned int len, u32 flags);
+ DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGORITHM, crypto_algorithm_transform, int,
    (struct crypto_tfm *tfm, const u8 *src, u8 *dst, unsigned int len, u32 flags),
    (tfm, src, dst, len, flags));
```
Then, add the corresponding stubs in `crypto/fips140/fips140-api.c`:
```
#if IS_BUILTIN(CONFIG_CRYPTO_ALGORITHM)
#include <crypto/algorithm.h>
DEFINE_CRYPTO_API_STUB(crypto_algorithm_transform);
#endif
```
For Architecture-Specific Cryptographic Algorithms:
- Include architecture-specific stubs in `arch/*/crypto/fips140/fips140-api.c`:
```
# Example: in arch/arm64/crypto/fips140/fips140-api.c
#if IS_BUILTIN(CONFIG_CRYPTO_AES_ARM64_CE)
#include <arch/arm64/crypto/aes-ce-setkey.h>
DEFINE_CRYPTO_API_STUB(ce_aes_setkey);
DEFINE_CRYPTO_API_STUB(ce_aes_expandkey);
#endif
```
**Step 3: Update Initialization**
Replace module initialization calls:
```
# in crypto/algorithm/algorithm.c
- module_init(algorithm_init);
- module_exit(algorithm_exit);
+ crypto_module_init(algorithm_init);
+ crypto_module_exit(algorithm_exit);
```

### 5.3. Architecture-Specific Extensions

**Extending to New Architectures:**
Currently supported architectures are x86_64 and ARM64. To extend this feature to additional architectures:
1. **Update Linker Scripts**: Add ELF sections in `arch/[new-arch]/kernel/vmlinux.lds.S`:
```
.fips140_embedded : AT(ADDR(.fips140_embedded) - LOAD_OFFSET) {
    . = ALIGN(8);
    _binary_fips140_ko_start = .;
    KEEP(*(.fips140_module_data))
    _binary_fips140_ko_end = .;
}
```
2. **Create Architecture-Specific Files**: Set up `arch/[new-arch]/crypto/fips140/` directory with Makefile and `fips140-api.c` following the pattern used in x86_64 and ARM64.

## 6. Related Work and Comparison

The idea of modularizing kernel cryptographic functionality has also attracted attention from other Linux distributions as well as Linux-kernel-based platforms that are not traditional distributions. Specifically, there are two related efforts: one from [Android's GKI kernel](https://source.android.com/docs/core/architecture/kernel/gki-fips140-module) and another from [Oracle Linux](https://git.kernel.org/pub/scm/linux/kernel/git/vegard/linux-fips140.git/log/?h=fips140). While Amazon Linux incorporated several valuable ideas from these efforts (and have acknowledged them in the patch commits—thank you again!), this section highlights the key differences between those approaches and this approach. The goal is to describe the trade-offs and design choices objectively, rather than to criticize other implementations.

### 6.1. Comparison with Android's GKI

Android's work is the earliest one on modularizing kernel cryptographic code, and it targets a non-intrusive approach to the core GKI kernel, with the goal of minimizing modifications to the kernel source. To achieve this, the crypto module relies on several interception or "hijacking" techniques that intervene in the core kernel execution path.

While this approach minimizes kernel code changes, we don't adopt such an approach for several reasons. First, these interception mechanisms tightly depend on internal kernel crypto subsystem behavior, making them fragile across major kernel updates thus less suitable to reuse the same module on newer major kernel versions. Second, this design requires substantial additional cryptographic code duplication, which impacts maintainability. Finally, the solution only supports a fixed set of cryptographic algorithms, making it non-general and difficult to extend.

In contrast, our design integrates directly into the Linux kernel source tree, avoids duplicated cryptographic implementations, supports arbitrary kernel configuration settings, and works with any chosen set of cryptographic algorithms.

### 6.2. Comparison with Oracle Linux

Oracle’s work was developed concurrently with this approach. The primary differences between Oracle’s approach and Amazon's lie in build integration, pluggable interface design, and module initialization.

**Build Integration:**
Oracle's module is implemented as an out-of-tree module with a separate Makefile. This introduces three major reasons we don't adopt such an approach: 

*First*, the separate Makefile duplicates many kernel build rules, which increases maintenance cost, as upstream kernel build changes must be tracked and replicated. One concrete example can be seen below:

in Oracle's module makefile
```
fips140-y += crypto/skcipher.o
fips140-y += crypto/lskcipher.o
```
However, in upstream, the corresponding build logic is more complex and configuration-dependent:
```
crypto_skcipher-y += lskcipher.o
crypto_skcipher-y += skcipher.o
obj-$(CONFIG_CRYPTO_SKCIPHER2) += crypto_skcipher.o
ifeq ($(CONFIG_BPF_SYSCALL),y)
obj-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
endif
```
As shown above, when `CONFIG_BPF_SYSCALL` is enabled, `bpf_crypto_skcipher.o` must also be included. Tracking such dependencies is hard in the duplicated Makefile approach. In contrast, our approach integrates seamlessly into the kernel build system by introducing a customized build rule (`crypto-objs-*`) rather than relying on a duplicated Makefile, such that this is handled correctly by reusing the existing kernel build logic:
```
crypto_skcipher-y += lskcipher.o
crypto_skcipher-y += skcipher.o
- obj-$(CONFIG_CRYPTO_SKCIPHER2) += crypto_skcipher.o
+ crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += crypto_skcipher.o
ifeq ($(CONFIG_BPF_SYSCALL),y)
- obj-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
+ crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
endif
```
As a result, such a Makefile-duplication approach does not scale well across all kernel configurations and does not easily support arbitrary sets of cryptographic algorithms.

*Second*, since the module is to be embedded as part of the kernel image (i.e., `vmlinux`) as described earlier, the module build must be triggered automatically as part of the `vmlinux` build process to achieve a seamless build workflow. However, Oracle's module build is not tightly integrated into the kernel build framework and requires special build commands (e.g., first do `make M=fips140/` specifically, then do some shell command and finally `make`). 

In contrast, our approach improves this aspect by integrating the module build tightly into the regular kernel build, so the build process is seamless and automatic with regular build and packaging processes such as `make` or `make vmlinux` or `make install`.

**Pluggable Interface:**
There are several differences in the pluggable interface design.

*First*, we avoid duplicate crypto code so only keep one crypto code in kernel memory, while existing work keeps two crypto code even if these crypto code are from the same source code. This is due to the way Oracle defines pluggable interface macros in `crypto/api`, where its design requires some cryptographic code to remain compiled into the main kernel image in addition to the code inside the standalone cryptography module. Keeping two crypto code is ok if these code are different and designed to be used for different runtime modes (i.e., FIPS/non-FIPS mode), but will be unnecessary if both crypto code are the same.

In contrast, the approach we use can flexibly support both choices: keep one cryptography subsystem, or two different crypto subsystems. To do so, we introduce an option `CRYPTO_FIPS140_DUAL_VERSION` such that when it is disabled, we only keep one cryptographic subsystem in the cryptography module while completely removing it from the main kernel; and when it is enabled, we allow having two different modules carrying different cryptography for different kernel runtime modes (i.e., FIPS and non-FIPS mode).

*Second*, existing approach requires modifications to both the cryptographic implementation (.c) files and the declaration (.h) header files while our approach only requires modifying the header file, making the change less intrusive to the kernel codebase.

*Third*, prior approaches mainly support making cryptographic function calls pluggable, while our approach extends pluggability to cryptographic variables as well.

*Fourth*, prior approach requires all cryptographics that we care (for any purpose such as those within FIPS boundary) to be included within a single kernel module `fips140.ko` (e.g., when `CONFIG_CRYPTO_AES=m`, it cannot be `aes.ko` but must be within fips140.ko). However, this requirement limits the inherent benefit of a kernel module (i.e., on-demand loading for memory efficiency). In contrast, our approach allows the cryptographic we care remain its original modular if it is configured as being so (i.e., if `CONFIG_CRYPTO_AES=m`, the aes will still be as `aes.ko` but not forced to `fips140.ko`) up to the `.config` setting. One benefit of this design is that it does not impose strict requirements on `.config` setting (i.e., a cryptography `.config` can be set to both `=y|m` while existing work must be set as `=y`), preserving configuration flexibility.

To support so, for any cryptography within the interest (i.e., whose makerule has been replaced with `crypto-objs-*`) but configured as build-as-module (i.e., `CONFIG_CRYPTO_*=m`), its compiled `.ko` binary will be marked automatically, such that the loader will have a way to recognize to perform some interest-specific processing (e.g., registered as FIPS-required flag) if needed. And the pluggable interface can also adjust its coverage automatically based on different `CONFIG_CRYPTO_*=y|=m` settings. This is achieved by letting the pluggable interface macro to take `CONFIG_CRYPTO_*` option as a parameter to recognize the `.config` setting.

**Module Initialization:**
Oracle's initialization routine does not guarantee preservation of the original crypto initialization order (i.e., the order they should follow if they were originally built-in in the main kernel), which limits its ability to support arbitrary combinations of cryptographic algorithms. This is because the crypto initialization routine in the module is executed too early, such that all module crypto is initialized before the cryptography init in the main kernel. So if there is a crypto in the module (e.g., a crypto init defined as `late_init()`) that depends on a cryptography (whose init is defined as `module_init()`) in the main kernel, since the one in the main kernel should be executed earlier (but because the module init is too early, it makes the crypto in the main kernel executed too late), such a case will break the kernel boot process.

Our design, on the other hand, introduces explicit initialization synchronization mechanisms between cryptography's init routine in the module and in the main kernel that can preserve the original built-in initialization order. As a result, our module supports any chosen crypto set to be included in the module.

### 6.3. Comparison Summary

Overall, combined with differences in coding style and integration strategy, the proposed approach is more seamlessly integrated with the upstream Linux kernel, making it more generalizable across different kernel configuration settings, and the changed behavior more invisible to kernel users.

## 7. Summary
In this patch series, Amazon Linux proposes a new kernel feature that decouples the built-in crypto subsystem into a dedicated kernel module. To achieve this, several key mechanisms are designed, including specialized compile rules, a novel pluggable interface mechanism, and a module-loading initialization process. This feature is designed in an upstream-friendly manner so that it can support arbitrary kernel configuration settings and arbitrary chosen sets of cryptographic algorithms. It is planned to be officially launched with the Amazon Linux Kernel 6.18 and future kernels.

---
Written by Jay Wang <wanjay@amazon.com>, Amazon Linux


Jay Wang (91):
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO and CONFIG_CRYPTO_ALGAPI2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_AES crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_AEAD2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_GENIV crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SKCIPHER2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_HASH2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_AKCIPHER2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SIG2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_KPP2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_RSA crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ACOMP2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_MANAGER2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_MD5 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SHA3 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_AUTHENC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_LZO crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_RNG2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_ASYMMETRIC_KEY_TYPE crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_X509_CERTIFICATE_PARSER crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_PKCS7_MESSAGE_PARSER crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ENGINE crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_HKDF crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_DH crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ECDSA and CONFIG_CRYPTO_ECC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_USER crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_XCBC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_NULL crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_MD4 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_RMD160 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SHA1 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SM3_GENERIC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_STREEBOG crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_WP512 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_BLAKE2B crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_PCBC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CTS crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_LRW crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_XTS crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_XCTR and CONFIG_CRYPTO_HCTR2 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ADIANTUM crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CHACHA20 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CHACHA20POLY1305 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_AEGIS128 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CRYPTD crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_DES crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_FCRYPT crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_BLOWFISH and CONFIG_CRYPTO_BLOWFISH_COMMON crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SM4 and CONFIG_CRYPTO_SM4_GENERIC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_TWOFISH and CONFIG_CRYPTO_TWOFISH_COMMON crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SERPENT crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CAMELLIA crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CAST_COMMON, CONFIG_CRYPTO_CAST5, CONFIG_CRYPTO_CAST6
    crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ARC4 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_USER_API crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_USER_API_SKCIPHER crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_TEA crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_KHAZAD crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ANUBIS crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SEED crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ARIA crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_DEFLATE crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_MICHAEL_MIC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CRC32C and CONFIG_CRYPTO_CRC32 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_KRB5ENC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_LZ4 and CONFIG_CRYPTO_LZ4HC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_XXHASH crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_842 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_BENCHMARK crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_USER_API_HASH crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_USER_API_RNG crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_USER_API_AEAD crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ZSTD crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ESSIV crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ECDH crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ECRDSA crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_XOR_BLOCKS crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_ASYNC_CORE crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_ASYNC_MEMCPY crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_ASYNC_XOR crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_ASYNC_PQ crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_ASYNC_RAID6_RECOV crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_KDF800108_CTR crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_KRB5 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_FIPS_SIGNATURE_SELFTEST crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_PKCS8_PRIVATE_KEY_PARSER crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_PKCS7_TEST_KEY crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_SIGNED_PE_FILE_VERIFICATION crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SIMD crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_ASYNC_RAID6_TEST crypto

Vegard Nossum (15):
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SEQIV crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ECHAINIV crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CMAC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_HMAC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SHA256 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_SHA512 crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_ECB crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CBC crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CTR crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_GCM crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_CCM crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_DRBG crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_JITTERENTROPY crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_GHASH crypto
  crypto: convert exported crypto symbol into pluggable interface for
    CONFIG_CRYPTO_PCRYPT crypto

 certs/system_keyring.c                   |   1 +
 crypto/842.c                             |   4 +-
 crypto/Makefile                          | 204 ++---
 crypto/adiantum.c                        |   4 +-
 crypto/aegis128-core.c                   |   4 +-
 crypto/aes.c                             |   4 +-
 crypto/af_alg.c                          |   4 +-
 crypto/algapi.c                          |   4 +-
 crypto/algboss.c                         |   4 +-
 crypto/algif_aead.c                      |   4 +-
 crypto/algif_hash.c                      |   4 +-
 crypto/algif_rng.c                       |   4 +-
 crypto/algif_skcipher.c                  |   4 +-
 crypto/anubis.c                          |   4 +-
 crypto/arc4.c                            |   4 +-
 crypto/aria_generic.c                    |   4 +-
 crypto/asymmetric_keys/Makefile          |  16 +-
 crypto/asymmetric_keys/asymmetric_type.c |   4 +-
 crypto/asymmetric_keys/pkcs7_key_type.c  |   6 +-
 crypto/asymmetric_keys/pkcs8_parser.c    |   4 +-
 crypto/asymmetric_keys/restrict.c        |   3 +-
 crypto/asymmetric_keys/selftest.c        |   2 +-
 crypto/asymmetric_keys/verify_pefile.c   |   1 +
 crypto/asymmetric_keys/x509_parser.h     |  15 +-
 crypto/asymmetric_keys/x509_public_key.c |   4 +-
 crypto/async_tx/Makefile                 |  12 +-
 crypto/async_tx/async_pq.c               |   4 +-
 crypto/async_tx/async_tx.c               |   4 +-
 crypto/async_tx/raid6test.c              |   4 +-
 crypto/authenc.c                         |   4 +-
 crypto/authencesn.c                      |   4 +-
 crypto/blake2b.c                         |   4 +-
 crypto/blowfish_generic.c                |   4 +-
 crypto/bpf_crypto_skcipher.c             |   4 +-
 crypto/camellia_generic.c                |   4 +-
 crypto/cast5_generic.c                   |   4 +-
 crypto/cast6_generic.c                   |   4 +-
 crypto/cbc.c                             |   4 +-
 crypto/ccm.c                             |   4 +-
 crypto/chacha.c                          |   4 +-
 crypto/chacha20poly1305.c                |   4 +-
 crypto/cmac.c                            |   4 +-
 crypto/crc32.c                           |   4 +-
 crypto/crc32c.c                          |   4 +-
 crypto/cryptd.c                          |   4 +-
 crypto/crypto_null.c                     |   4 +-
 crypto/crypto_user.c                     |   4 +-
 crypto/ctr.c                             |   4 +-
 crypto/cts.c                             |   4 +-
 crypto/deflate.c                         |   4 +-
 crypto/des_generic.c                     |   4 +-
 crypto/dh.c                              |   4 +-
 crypto/drbg.c                            |   4 +-
 crypto/ecb.c                             |   4 +-
 crypto/ecdh.c                            |   4 +-
 crypto/ecdsa.c                           |   4 +-
 crypto/echainiv.c                        |   4 +-
 crypto/ecrdsa.c                          |   4 +-
 crypto/essiv.c                           |   4 +-
 crypto/fcrypt.c                          |   4 +-
 crypto/fips140/fips140-api.c             | 934 ++++++++++++++++++++++-
 crypto/gcm.c                             |   4 +-
 crypto/ghash-generic.c                   |   4 +-
 crypto/hctr2.c                           |   4 +-
 crypto/hkdf.c                            |   4 +-
 crypto/hmac.c                            |   4 +-
 crypto/internal.h                        |  89 ++-
 crypto/jitterentropy-kcapi.c             |   4 +-
 crypto/kdf_sp800108.c                    |   4 +-
 crypto/khazad.c                          |   4 +-
 crypto/krb5/Makefile                     |   2 +-
 crypto/krb5/krb5_api.c                   |   4 +-
 crypto/krb5enc.c                         |   4 +-
 crypto/lrw.c                             |   4 +-
 crypto/lz4.c                             |   4 +-
 crypto/lz4hc.c                           |   4 +-
 crypto/lzo-rle.c                         |   4 +-
 crypto/lzo.c                             |   4 +-
 crypto/md4.c                             |   4 +-
 crypto/md5.c                             |   4 +-
 crypto/michael_mic.c                     |   4 +-
 crypto/pcbc.c                            |   4 +-
 crypto/pcrypt.c                          |   4 +-
 crypto/rmd160.c                          |   4 +-
 crypto/rsa.c                             |   4 +-
 crypto/seed.c                            |   4 +-
 crypto/seqiv.c                           |   4 +-
 crypto/serpent_generic.c                 |   4 +-
 crypto/sha1.c                            |   4 +-
 crypto/sha256.c                          |   4 +-
 crypto/sha3.c                            |   4 +-
 crypto/sha512.c                          |   4 +-
 crypto/sm3_generic.c                     |   4 +-
 crypto/sm4_generic.c                     |   4 +-
 crypto/streebog_generic.c                |   4 +-
 crypto/tcrypt.c                          |   4 +-
 crypto/tea.c                             |   4 +-
 crypto/twofish_generic.c                 |   4 +-
 crypto/wp512.c                           |   4 +-
 crypto/xcbc.c                            |   4 +-
 crypto/xctr.c                            |   4 +-
 crypto/xor.c                             |   4 +-
 crypto/xts.c                             |   4 +-
 crypto/xxhash_generic.c                  |   4 +-
 crypto/zstd.c                            |   4 +-
 include/crypto/acompress.h               |  14 +-
 include/crypto/aead.h                    |  30 +-
 include/crypto/akcipher.h                |  12 +-
 include/crypto/algapi.h                  | 125 ++-
 include/crypto/aria.h                    |  16 +-
 include/crypto/authenc.h                 |  12 +-
 include/crypto/blowfish.h                |   6 +-
 include/crypto/cast5.h                   |  14 +-
 include/crypto/cast6.h                   |  19 +-
 include/crypto/cast_common.h             |  17 +-
 include/crypto/cryptd.h                  |  56 +-
 include/crypto/dh.h                      |  14 +-
 include/crypto/ecc_curve.h               |   9 +-
 include/crypto/ecdh.h                    |  14 +-
 include/crypto/engine.h                  | 140 ++--
 include/crypto/hash.h                    |  53 +-
 include/crypto/hkdf.h                    |  13 +-
 include/crypto/if_alg.h                  |  84 +-
 include/crypto/internal/acompress.h      |  27 +-
 include/crypto/internal/aead.h           |  28 +-
 include/crypto/internal/akcipher.h       |  12 +-
 include/crypto/internal/cipher.h         |  20 +-
 include/crypto/internal/ecc.h            |  91 ++-
 include/crypto/internal/geniv.h          |  14 +-
 include/crypto/internal/hash.h           |  59 +-
 include/crypto/internal/kpp.h            |  12 +-
 include/crypto/internal/rng.h            |  21 +-
 include/crypto/internal/rsa.h            |   7 +-
 include/crypto/internal/scompress.h      |   9 +-
 include/crypto/internal/sig.h            |  12 +-
 include/crypto/internal/simd.h           |  33 +-
 include/crypto/internal/skcipher.h       |  91 ++-
 include/crypto/kdf_sp800108.h            |  14 +-
 include/crypto/kpp.h                     |   5 +-
 include/crypto/krb5.h                    |  78 +-
 include/crypto/md5.h                     |   8 +-
 include/crypto/pkcs7.h                   |  31 +-
 include/crypto/public_key.h              |  44 +-
 include/crypto/rng.h                     |  18 +-
 include/crypto/scatterwalk.h             |  36 +-
 include/crypto/serpent.h                 |  20 +-
 include/crypto/sig.h                     |   3 +-
 include/crypto/skcipher.h                |  56 +-
 include/crypto/sm4.h                     |  22 +-
 include/crypto/twofish.h                 |  11 +-
 include/keys/asymmetric-parser.h         |   8 +-
 include/keys/asymmetric-type.h           |  37 +-
 include/linux/async_tx.h                 |  76 +-
 include/linux/crypto.h                   |  22 +-
 include/linux/raid/xor.h                 |   7 +-
 include/linux/verification.h             |   8 +-
 156 files changed, 2302 insertions(+), 943 deletions(-)

-- 
2.47.3


