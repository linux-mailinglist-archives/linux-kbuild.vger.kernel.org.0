Return-Path: <linux-kbuild+bounces-12473-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cChBDYcIzWl/ZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12473-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:59:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FECD379FEF
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB2EC315333D
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B583E7146;
	Wed,  1 Apr 2026 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRqDupu+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74EF324B16;
	Wed,  1 Apr 2026 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043975; cv=none; b=s3UgFMSLAF6O4xEm71hbAT7gz5+IS6jZkhdcNdlyO6jC0mRPl38ITChOyO2xcRLZnrRNGJxGUx1vSFNFwk4U1hCYEIBl+5EtGyRx78TXK25boMzUCG+DK+yXudhsCo/COJHhuKZeCyKHl0V/oFtCqVFcbfaAa70m4DIH3tAUmUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043975; c=relaxed/simple;
	bh=ee9ui+LCdpJHl0TldbW+Hj1cIbucU9apUqrPLbY+gwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+sCX8EtTW6ef9bu1G5Ixyxh9LMkXepSqOdhZheUrcFr4HFscDibKGS0Ygy97o4Wm5yDxg1bteH/i54Zzwt/03zxDkVO7RInukdMb4JlWyque8u2pWhaRSzZAzYr9rP/NvcXXG45yXcGQg63jWSHgVDzttgJ64BBBPEwmogTlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRqDupu+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314CBC4CEF7;
	Wed,  1 Apr 2026 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043975;
	bh=ee9ui+LCdpJHl0TldbW+Hj1cIbucU9apUqrPLbY+gwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRqDupu+DKvNmwW+4j5ymsnMQyV8FjWKLKLMuRfJUaFNjjRl8TChFt1O49A4LriR4
	 aCxNadQPRYWuZCjWbo1G44JNcreCgipEpTp25HG8+WRGEQpYq7kENnhi95ZvkothfB
	 1r+PascAFPeFUZ3UdnavVyKxTrY5sFckDghBLAV95wFV/7g0t8aY2T6Fli7cVnPYN5
	 rkQQwfKcvN45XkZT1HU8FQsC/R0ookEadJs+Fu2CukxnkXqGoBe7jjSw5pUxfGmltp
	 jaO17kwZAxx2dXVmEEDxPcOzWr8F1PnIUzJ/2t3S/iYg3yjijoVzP0yNPKxQ0FAq8T
	 OxPArPyTGQbbQ==
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
Subject: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0 (Debian Trixie)
Date: Wed,  1 Apr 2026 13:45:08 +0200
Message-ID: <20260401114540.30108-2-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12473-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:url,launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:url]
X-Rspamd-Queue-Id: 7FECD379FEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
we are going to follow Debian Stable's Rust versions as our minimum
supported version.

Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
still uses to this day [3] (i.e. no update to Rust 1.85.1).

Debian Trixie's release happened on 2025-08-09 [4], which means that a
fair amount of time has passed since its release for kernel developers
to upgrade.

Thus bump the minimum to the new version.

Then, in later commits, clean up most of the workarounds and other bits
that this upgrade of the minimum allows us.

pin-init was left as-is since the patches come from upstream. And the
vendored crates are unmodified, since we do not want to change those.

Note that the minimum LLVM major version for Rust 1.85.0 is LLVM 18 (the
Rust upstream binaries use LLVM 19.1.7), thus e.g. `RUSTC_LLVM_VERSION`
tests can also be updated, but there are no suitable ones to simplify.

Ubuntu 25.10 also has a recent enough Rust toolchain [5], and they also
provide versioned packages with a Rust 1.85.1 toolchain even back to
Ubuntu 22.04 LTS [6].

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
Link: https://packages.debian.org/trixie/rustc [3]
Link: https://www.debian.org/releases/trixie/ [4]
Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=rustc [5]
Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/process/changes.rst | 2 +-
 scripts/min-tool-version.sh       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..474594bd4831 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -31,7 +31,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
 GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  15.0.0           clang --version
-Rust (optional)        1.78.0           rustc --version
+Rust (optional)        1.85.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
 GNU make               4.0              make --version
 bash                   4.2              bash --version
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 99b5575c1ef7..a270ec761f64 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,7 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.78.0
+	echo 1.85.0
 	;;
 bindgen)
 	echo 0.65.1
-- 
2.53.0


