Return-Path: <linux-kbuild+bounces-13400-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANrOJJu8GGp8mwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13400-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 00:07:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DBA5FAC6A
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 00:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2988530499A8
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC61B368294;
	Thu, 28 May 2026 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4mILtj3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874E35AC10;
	Thu, 28 May 2026 22:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006035; cv=none; b=FEMLBdRkg1A1ujDp+ZkKd4fM69BgQbWy09FC8OzUwvbh0MF3LGWaicIOefBpfN8/+vGvT2n0D1SmqEu4xlXL2cPEWAa1G698a7Lj6X3OAmqFOQH0VXFONGuN2ffoey5vdfy15Nqsld65U6Keg/IJb9RPhyc/sIVURxvZSqAtWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006035; c=relaxed/simple;
	bh=r/TESHHd+9Ajc3Dle1HBSrY5sagpHkmz4msWbaHdOHU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uPFG4+p9/KZv71bkixA0or44jzp5ZHBGSni81X7InHu7o2gK/v4nAbkxIsQOBt28QGOkr3eDYF4rYCS0jHKoyDSaIjRBz6lVVu0qZgQkkQ2TqVlW/wKYsYK4c9tS0uikzAjgvNg59o48jyvol6Pq5Avcw2iVOLGwTL7mX5mxXII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4mILtj3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C88A1F00A3A;
	Thu, 28 May 2026 22:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006034;
	bh=cotglDt+0ZWigWJpRRu9N7ejYCW3NC13PopI8oClGus=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Z4mILtj3kd9q3B0+eMhQaJikZC4W7xSaIt6n5IKkjBT2Ci4y1QgmKRfSvIuVI/dh5
	 Zg16LFe8UGOn5jfyr/VaiJddTZhNKsSCX7mX6stfhpzLIKZRsxiWU3itySJ9pAacl3
	 vZO6fZMFViofZ3zD6W/3xxrdGnX1yfesbIHBYNchpHDqyMj/Tg6KsJH8kcKJNgct9C
	 sK0IhIUrDr3znUYe+tSt+NxnGdyNVxg5a8jTL7Zl4S1y4j9KpuYVy/ISjEyF3hhYl4
	 1/r52RRGSCZZKKFjYfuCpbJNGzw+nHVlYmFkVMQPoKuTdl3jkonCfo8V5/xIdmiiB8
	 /irZDQrIWb0Pg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 3/3] kbuild: distributed build support for Clang
 ThinLTO
From: Nathan Chancellor <nathan@kernel.org>
To: xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Yonghong Song <yonghong.song@linux.dev>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Stafford Horne <shorne@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Piotr Gorski <piotrgorski@cachyos.org>, 
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260528203905.687687-4-xur@google.com>
References: <20260528203905.687687-1-xur@google.com>
 <20260528203905.687687-4-xur@google.com>
Date: Thu, 28 May 2026 15:07:03 -0700
Message-Id: <178000602351.678078.3534988919326810792.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847; i=nathan@kernel.org;
 h=from:subject:message-id; bh=r/TESHHd+9Ajc3Dle1HBSrY5sagpHkmz4msWbaHdOHU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkSe3pvde1Y++nZunMVOiLTt/lNDrv8riiilueK97T5D
 38qLH4v01HKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmct+N4b/zCpcl3E+11reW
 OLsoXcvRT/c48H/PYa2YZ6IyjButtNoZGaacXmwb03yBRXnxn9mvr1/mZpQW5Au+mxw9q1ra++N
 WURYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13400-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 38DBA5FAC6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 13:39:05 -0700, xur@google.com <xur@google.com> wrote:
> diff --git a/scripts/Makefile.thinlto b/scripts/Makefile.thinlto
> new file mode 100644
> index 000000000000..408b63786a08
> --- /dev/null
> +++ b/scripts/Makefile.thinlto
> @@ -0,0 +1,41 @@
> +PHONY := __default
> +__default:
> +
> +include include/config/auto.conf
> +include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
> +
> +native-objs := $(patsubst %.o,%.thinlto-native.o,$(call read-file, vmlinux.thinlto-index))
> +
> +__default: $(native-objs)
> +
> +# Generate .thinlto-native.o (obj) from .o (bitcode) and .thinlto.bc (summary) files
> +# ---------------------------------------------------------------------------
> +quiet_cmd_cc_o_bc = CC $(quiet_modtag)  $@
> +      be_flags = $(saved_c_flags_$(<))

This change...

> [ ... skip 20 lines ... ]
> +prereq-ir-objs := $(targets:%.thinlto-native.o=%.o)
> +existing-ir-objs := $(wildcard $(sort $(prereq-ir-objs)))
> +
> +-include $(foreach f, $(existing-targets) $(existing-ir-objs), $(dir $(f)).$(notdir $(f)).cmd)
> +
> +.PHONY: $(PHONY)

... and this change appear to break the build in certain circumstances.

  | $ printf 'CONFIG_%s\n' LTO_NONE=n LTO_CLANG_THIN_DIST=y >kernel/configs/repro.config
  |
  | $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 mrproper defconfig repro.config vmlinux
  | ...
  | warning: linking module 'virt/kvm/coalesced_mmio.o': Linking two modules of different target triples: 'mm/slab_common.o' is 'aarch64-unknown-linux-gnu' whereas 'virt/kvm/coalesced_mmio.o' is 'x86_64-unknown-linux-gnu' [-Wlinker-warnings]
  | '+v8a' is not a recognized feature for this target (ignoring feature)
  | '-fmv' is not a recognized feature for this target (ignoring feature)
  | '-fp-armv8' is not a recognized feature for this target (ignoring feature)
  | '-neon' is not a recognized feature for this target (ignoring feature)
  | '+v8a' is not a recognized feature for this target (ignoring feature)
  | '-fmv' is not a recognized feature for this target (ignoring feature)
  | '-fp-armv8' is not a recognized feature for this target (ignoring feature)
  | '-neon' is not a recognized feature for this target (ignoring feature)
  | <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
  |         dmb ishst
  |         ^~~
  | 2 warnings and 3 errors generated.
  | make[5]: *** [scripts/Makefile.thinlto:22: virt/kvm/dirty_ring.thinlto-native.o] Error 1
  | ...

Looking at V=1 output, the backend flags are missing from this object
and the other ones that errored. If I revert back to how you had it in
v10, the build is successful and the flags appear to be included
properly.

Sashiko has another comment as well.

  https://sashiko.dev/#/patchset/26003?part=3

-- 
Cheers,
Nathan


