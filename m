Return-Path: <linux-kbuild+bounces-12674-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CdPJ1z40mkXcwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12674-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:03:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB53A0B69
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C008F300E197
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332DE386428;
	Sun,  5 Apr 2026 23:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhX7OHEk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7133859C7;
	Sun,  5 Apr 2026 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433521; cv=none; b=TnjTnoqgASwqLWgRgtEZqb+MhaT1Q+P98q9UAKnlM3T+iY9I8oZ71vaFzdUEQ2w47oLXUz0DRqJYh+d/MuNVGjP4dEZi3EkyY5GVAHqsQjiiCI5pbzHBuYDl86pbsH/ZFAUKme3qRgvGNkB8LdOCOsgSvYdTStX4Vt/qKxiigJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433521; c=relaxed/simple;
	bh=o4Ra+oAdw7COOhgL+wfXvUxGOM6cAL7opNxNq4hxAf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uARxWAFDHWkgTB+cab0xfB6m5IvpQUAA/SznZPBhM60rqn+r2dnHyAOrQESdArUuB0dYcWQ0kXmkfDzlhhJBnx6f4b1++kxiR62x0Q0o7iLw6qNQBRALGT0yRGc67r6OWv/GOBYcqU1hFbWJyUBpKTS24B5BCfzhmBhiga04bbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhX7OHEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21757C2BC9E;
	Sun,  5 Apr 2026 23:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433520;
	bh=o4Ra+oAdw7COOhgL+wfXvUxGOM6cAL7opNxNq4hxAf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhX7OHEkRS4TngsHiqyFImNeylvupb9nev5vB3T1m4+yQd8SUeAkjDWjcjK0U0vln
	 tpolgmzKqd+q1FhWnq23lvcfT5UiW9ffCGs1MQDRgTwPKT4sE6zhhgIPGmQu6nDZon
	 tXnbT+DvezPf3MGHuw3kcd2PCZiBpCtiGUxvuAcu1hnl4rebmizvzZh71GYihzW3Hq
	 vW0UlPFQQSIheVr/MRAMdM0bPzbwzTtAAP2pBTunipsyJDhE99HZsUoCxTq9e8uW7A
	 w/SejrIbLFy4g8UyPixRpdq489fMG1PQAkc6d3WQaSgh0mCjPwvfmP+2fHNfVBrb3n
	 a7e5Xs+tjrNGQ==
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
	linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 28/33] docs: rust: quick-start: remove GDB/Binutils mention
Date: Mon,  6 Apr 2026 01:53:04 +0200
Message-ID: <20260405235309.418950-29-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12674-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9DEB53A0B69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The versions provided nowadays by even a distribution like Debian Stable
(and Debian Old Stable) are newer than those mentioned [1].

Thus remove the workaround.

Note that the minimum binutils version in the kernel is still 2.30, so
one could argue part of the note is still relevant, but it is unlikely
a kernel developer using such an old binutils is enabling Rust on a
modern kernel, especially when using distribution toolchains, e.g. the
Rust minimum version is not satisfied by Debian Old Stable.

So we are at the point where keeping the docs short and relevant for
essentially everyone is probably the better trade-off.

Link: https://packages.debian.org/search?suite=all&searchon=names&keywords=binutils [1]
Link: https://lore.kernel.org/all/CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com/
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 5bbe059a8fa3..a6ec3fa94d33 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -352,12 +352,3 @@ Hacking
 To dive deeper, take a look at the source code of the samples
 at ``samples/rust/``, the Rust support code under ``rust/`` and
 the ``Rust hacking`` menu under ``Kernel hacking``.
-
-If GDB/Binutils is used and Rust symbols are not getting demangled, the reason
-is the toolchain does not support Rust's new v0 mangling scheme yet.
-There are a few ways out:
-
-- Install a newer release (GDB >= 10.2, Binutils >= 2.36).
-
-- Some versions of GDB (e.g. vanilla GDB 10.1) are able to use
-  the pre-demangled names embedded in the debug info (``CONFIG_DEBUG_INFO``).
-- 
2.53.0


