Return-Path: <linux-kbuild+bounces-12413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCswAfn7y2mwNAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12413-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:53:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE136D535
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C77D313CB5A
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57B0426EA6;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmZnTkWs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77374425CE7;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975046; cv=none; b=rYHAE3MSHgJvhfJINYvHqXxwwwY7WEKqjURr1sK2HVrFqheOUZP2qeCdOastYfUOoE5+Y9SvsMqaRgFFyJnvWfLXzbJy5+XhME9invWLOMmDWtQyD0QqUW9U17fSL73j0079XTbSZFhf9L8tko3YiGOJgJ7BBOk9+3pJHZA+tKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975046; c=relaxed/simple;
	bh=mtI7hYxtLGh8UYHmT3w/ULXqZgCHpOOamGGALDedBw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=gpCXM1Ix/4O0SCvFNT6bpKFT02xjFksghviQR5FQJANDDxcMyqMq72kWr/Uo/bjVnY2cMNLjEPp2gXa94QU5oz4kBcJeEPqtlCS2Sul0C9pFDeQq1OTOIIsb9//BJvS3myIPpAy5wiumJIbiBxHJl+Ui21sKD3bFxcd0+jOpcEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmZnTkWs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2028AC19423;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975046;
	bh=mtI7hYxtLGh8UYHmT3w/ULXqZgCHpOOamGGALDedBw8=;
	h=From:To:Cc:Subject:Date:From;
	b=FmZnTkWstD2V+gR2UzIZnHqkagf3anT+Co3aUDxpDncrU/mgjU9GseCg8wynmU5K2
	 ulKRQ6+7+vRzuDrCNt1QjFCz85Z3PiKMPDIbKvnvRC09zWXwztpuJoLHfHXW9dPRP4
	 zXc5wDir/E19xBVk7LLLNHoWyoSBneHvueL/SQUhkGtg6M+glmrUXsJyaSUio21ASZ
	 9hZbeYbdZtLknfxe8II4GUf0PypQbk3s2NuE5fBRhKu4m+31ztDXQRa4B+++3LTBbs
	 eQbpZKDToSwy0jOfIHlGAdRVpe/TfftrP64Ww4UbeqHtS82SfOQpluBmJHhx1vJZfn
	 uPzdEP3ZKdc+g==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/5] Introduce Overflow Behavior Types
Date: Tue, 31 Mar 2026 09:37:18 -0700
Message-Id: <20260331163716.work.696-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3413; i=kees@kernel.org; h=from:subject:message-id; bh=mtI7hYxtLGh8UYHmT3w/ULXqZgCHpOOamGGALDedBw8=; b=owGbwMvMwCVmps19z/KJym7G02pJDJmnfzjcUr9ReWh+xYJi1fjngUz3+2+fc1h6TLTsmKYj9 04uu0qvjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIkYxzIy3DPkb369yE/4zOsj p+RuXpp69bV03u2pS6pVXgj4nNjYx8XwP4C5pZApbvL1T5PFOTI9GDMOsPK2XSrts13n8ue+6L0 iRgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12413-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20FE136D535
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This is the spiritual successor to the "Mitigating unexpected arithmetic
overflow" thread from 2024[1]. After a long discussion there, and
subsequent discussions with Peter at Linux Plumbers, Justin went off to
build a type-based solution. After more than a year of RFCs and feedback
from compiler folks and with an eye toward potentially making this part
of the C Standard in the future, what has evolved is Overflow Behavior
Types[2], which are first-class native types that mirror the existing
native scalar types in C. They are created using a type qualifier
("__ob_trap" and "__ob_wrap"), but they are their own distinct
types. e.g. "int" and "int __ob_trap" are different types, though
they are mostly interchangable (e.g. format strings, implicit casts,
etc), with some specific instrumentation in cases where wrap-around or
truncation is possible.

This series provides support for building with them enabled, adds
documentation, adds tests, and proposes the new typedefs (see the last
patch in the series) for the corresponding kernel scalar types. With this,
we can start converting variables (and types) that are never supposed
to overflow/underflow to these new types[3]. (Or types that are always
supposed to overflow/underflow.)

Enjoy! :)

-Kees

Link: https://lore.kernel.org/lkml/202404291502.612E0A10@keescook/ [1]
Link: https://clang.llvm.org/docs/OverflowBehaviorTypes.html [2]


Justin Stitt (2):
  hardening: Introduce Overflow Behavior Types support
  compiler_attributes: Add overflow_behavior macros __ob_trap and
    __ob_wrap

Kees Cook (3):
  refcount: Remove unused __signed_wrap function annotations
  lkdtm/bugs: Add basic Overflow Behavior Types test
  types: Add standard __ob_trap and __ob_wrap scalar types

 lib/Kconfig.ubsan                             |  18 -
 security/Kconfig.hardening                    |  50 ++-
 Makefile                                      |   1 +
 scripts/basic/Makefile                        |   2 +-
 scripts/Makefile.lib                          |   7 +-
 scripts/Makefile.obt                          |  28 ++
 scripts/Makefile.ubsan                        |  10 -
 scripts/Makefile.warn                         |   7 +
 scripts/integer-wrap-ignore.scl               |   3 +-
 Documentation/dev-tools/ubsan.rst             |  13 +
 Documentation/process/arithmetic-overflow.rst | 323 ++++++++++++++++++
 Documentation/process/deprecated.rst          |  39 +++
 Documentation/process/index.rst               |   1 +
 include/linux/compiler-version.h              |   2 +-
 include/linux/compiler_attributes.h           |  12 +
 include/linux/compiler_types.h                |   9 +-
 include/linux/refcount.h                      |  10 +-
 include/linux/sched.h                         |   3 +-
 include/linux/types.h                         |  24 ++
 include/linux/ubsan.h                         |  12 +-
 drivers/misc/lkdtm/bugs.c                     | 253 ++++++++++++++
 lib/ubsan.c                                   |  17 +-
 MAINTAINERS                                   |  10 +
 kernel/configs/hardening.config               |   1 -
 tools/testing/selftests/lkdtm/tests.txt       |  10 +
 25 files changed, 807 insertions(+), 58 deletions(-)
 create mode 100644 scripts/Makefile.obt
 create mode 100644 Documentation/process/arithmetic-overflow.rst

-- 
2.34.1


