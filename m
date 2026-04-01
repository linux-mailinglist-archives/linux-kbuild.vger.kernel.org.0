Return-Path: <linux-kbuild+bounces-12497-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIXBObQLzWnhZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12497-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:12:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0937A3E8
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C86B320FCA8
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B81C3FADF1;
	Wed,  1 Apr 2026 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYUKktNt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAD54070F9;
	Wed,  1 Apr 2026 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044259; cv=none; b=ZHns8hhisxnkBkCk1H5EXBkUY8YKhjWe19TaO8v2OOMKfC9cliWCq+xuG3zQnLmdhbv7Vo6wsLxPrzzhkxIIebqBE3PwtlYgG+thybU/UzxpA9UhWXUSZqIP1rubRTO+F+7BecXB65NuINu0Jow6tKO3/abSVh7pV7vNc/7gcM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044259; c=relaxed/simple;
	bh=ZrS7YCyshnbs/lG/9j9L7W/ZUrAuF338JPwI0nwq6Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxOe1TDL6hOW8pqozZANUPCg86D68IJ0kfDHClQ8z3J4kgK++6tuWQhqvwE/fRGgqNg+uP8bMdNKL+fJedhAKWep65ovOcuPShq0ZJIic/BhHe2rTS/ettGgnVf4RGDEzAstumXL45Vs7CPPeHeqX05M0CNTgkVZjUznrkKacIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYUKktNt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A793C4CEF7;
	Wed,  1 Apr 2026 11:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044258;
	bh=ZrS7YCyshnbs/lG/9j9L7W/ZUrAuF338JPwI0nwq6Ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYUKktNtjBtnO2jEekVdFzAXCPxvMmq8cOZ/wimER2kJOuz26TYi2q5bk91NF6CFY
	 V3uRQuToa4yd5/BlRrJuDUAvl/Ng8LmL71ojncQB2XFtcInSO8RsXWX1UcDolbNEKf
	 Vr7CCsu4JLP8hJ8Kq7urO0JEocaF0r6VbZa+42Sdln5aiR3/s6R5CaAOkIYDTOBYFN
	 jQ19XQq/9YUv1eHqK24bolOhTgYGxRPfjpfeAX42W17zK+3HMCGkzXRWdt2m3/51bF
	 jzN98RjCjBcK57ESqOPlvU09ERPYNtXiyClFAHc+QnLlv5x2uSLTqHwOePbncyE2kZ
	 tpwl4A5SNvXTg==
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
Subject: [PATCH 25/33] docs: rust: quick-start: add Ubuntu 26.04 LTS and remove subsection title
Date: Wed,  1 Apr 2026 13:45:32 +0200
Message-ID: <20260401114540.30108-26-ojeda@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-12497-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ubuntu.com:url]
X-Rspamd-Queue-Id: 77C0937A3E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ubuntu 26.04 LTS (Resolute Raccoon) is scheduled to be released in a few
weeks [1], and it has a recent enough Rust toolchain, just like Ubuntu
25.10 has [2][3].

We could update the title and the paragraph, but to simplify and to
make it more consistent with the other distributions' sections, let's
instead just remove that title. It will also reduce the differences
later on to keep it updated. Eventually, when we remove the remaining
subsection for older LTSs, Ubuntu should be a small section like the
other distributions.

Thus remove the title and add the mention of Ubuntu 26.04 LTS.

Link: https://documentation.ubuntu.com/release-notes/26.04/schedule/#resolute-raccoon-schedule [1]
Link: https://packages.ubuntu.com/search?keywords=rustc&searchon=names&exact=1&suite=all&section=all [2]
Link: https://packages.ubuntu.com/search?keywords=bindgen&searchon=names&exact=1&suite=all&section=all [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 34c39f208333..db08c3a03a4f 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -90,10 +90,7 @@ they should generally work out of the box, e.g.::
 Ubuntu
 ******
 
-25.10
-~~~~~
-
-The latest Ubuntu releases provide recent Rust releases and thus they should
+Ubuntu 25.10 and 26.04 LTS provide recent Rust releases and thus they should
 generally work out of the box, e.g.::
 
 	apt install rustc rust-src bindgen rustfmt rust-clippy
-- 
2.53.0


