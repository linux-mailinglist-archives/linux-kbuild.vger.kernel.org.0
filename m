Return-Path: <linux-kbuild+bounces-12486-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCZcMgoJzWm3ZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12486-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:01:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16C37A08D
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62D233198666
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428F8401493;
	Wed,  1 Apr 2026 11:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl4V3Ob2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6EF3E6DEB;
	Wed,  1 Apr 2026 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044129; cv=none; b=NwsrHVO468k0edP3H8x+knsk3V28JJDO8V2H02t+oDD1QGs3KI0NR9iZiIgcUA1BmZN/cf7BlWWb5WqD+Xt1Nc9Wg9u1wdMgy/97QH2t3IG6PhFZNSUtGUDCWQ9AJ+etHB43IbmGh8Q2waRPSoq/6Z54ZqSvfmd+O4xfqBElGJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044129; c=relaxed/simple;
	bh=ARQPdLFNgLGMMD7Hlk1KS8FPcB6q/KuXKhlNKcpj/sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNH5RBGJivpuwa0UqXnjzGcpkRM49HdQBR5qa19UsRyyyTALwa5Gl8aso846PSHdUJ5+WQQj0Wi7ZouYNa8Akavy999p2sv2bznkK6hZrLGYKJ6BQQmRLwGJb+CSdrTVwl+9K/RHvAB5dBjMf5n9swb9bDy2wPioE7V8F38siv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl4V3Ob2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A4EC4CEF7;
	Wed,  1 Apr 2026 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044128;
	bh=ARQPdLFNgLGMMD7Hlk1KS8FPcB6q/KuXKhlNKcpj/sM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sl4V3Ob2163+RRCKSkLp4ZUuMaSDTTdLiFNQWuFCXKv1Krlrxuela9RxhT+4wUwjt
	 yhYttjDbZQxVHrAv8b/esKNF8VdheRCH3Oqdk/2NAgGn2nejx2h4jXPJbvv4jYQuaV
	 TjMZ/sfmInsww6vddePv9CyGl3rBljLG5MSbIM1HplnFVuq2+FuvEOKtxe7XZRnNrz
	 CMgzmsPy7rtZc6T52JJnndKutrM/pbY6DTPy3eV6rHBgOeGBKJj34eqEze+SU45zwb
	 4y3EKNzMX7CayXffABQD13PIYCldiSPMdtIKe0RW2wa3PA3X1DcERUC8zGiKtwfVVr
	 pDCwDzyZt9PIQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 14/33] rust: bump `bindgen` minimum supported version to 0.71.1 (Debian Trixie)
Date: Wed,  1 Apr 2026 13:45:21 +0200
Message-ID: <20260401114540.30108-15-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12486-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:url,launchpad.net:url,lwn.net:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D16C37A08D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
we are going to follow Debian Stable's `bindgen` versions as our minimum
supported version.

Debian Trixie was released with `bindgen` 0.71.1, which it still uses
to this day [2].

Debian Trixie's release happened on 2025-08-09 [3], which means that a
fair amount of time has passed since its release for kernel developers
to upgrade.

Thus bump the minimum to the new version.

Then, in later commits, clean up most of the workarounds and other bits
that this upgrade of the minimum allows us.

Ubuntu 25.10 also has a recent enough `bindgen` [4] (even the already
unsupported Ubuntu 25.04 had it), and they also provide versioned packages
with `bindgen` 0.71.1 back to Ubuntu 24.04 LTS [5].

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://packages.debian.org/trixie/bindgen [2]
Link: https://www.debian.org/releases/trixie/ [3]
Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=bindgen [4]
Link: https://launchpad.net/ubuntu/+source/rust-bindgen-0.71 [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/process/changes.rst | 2 +-
 scripts/min-tool-version.sh       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 474594bd4831..84156d031365 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -32,7 +32,7 @@ you probably needn't concern yourself with pcmciautils.
 GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  15.0.0           clang --version
 Rust (optional)        1.85.0           rustc --version
-bindgen (optional)     0.65.1           bindgen --version
+bindgen (optional)     0.71.1           bindgen --version
 GNU make               4.0              make --version
 bash                   4.2              bash --version
 binutils               2.30             ld -v
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index a270ec761f64..b96ec2d379b6 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -34,7 +34,7 @@ rustc)
 	echo 1.85.0
 	;;
 bindgen)
-	echo 0.65.1
+	echo 0.71.1
 	;;
 *)
 	echo "$1: unknown tool" >&2
-- 
2.53.0


