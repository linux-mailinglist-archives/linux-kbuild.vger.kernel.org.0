Return-Path: <linux-kbuild+bounces-12886-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLQ1MNeg72kcDgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12886-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 19:45:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F7B477DEE
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 19:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 558E4303C40C
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 17:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21513B9D97;
	Mon, 27 Apr 2026 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlhgejSs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018F3E122D
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311880; cv=none; b=Tyo+R9uEWCX1Jt6vE6k673++33cqnZOlhDLoNIZW0s7Q6Qm0jDSVFgakEXzDC7+TONzWXFL4k2oXtsipzFrUC2Ot+2IYg2l73XQ8e+JGhps0URuIGlIIf7q4r2iWCrQ+RRjGx+eXT4OeaBoLxpWh8jBc/eGXjHGKZGHzFv4sMR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311880; c=relaxed/simple;
	bh=rO7ov8QJ49GcC76RgXU3j5+kIEi3gk/U+tPwA6Wotq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ULa2VWAPuMuYlHZ5e8Ei2VSe0ZAHlCotalA2U+NYv+Hys8Bq2TYdvP4LymLl2DbDnb5WIMhKQrRivnrs4Yhil6JQLg0/VTt5oH2ImVKIXhk/1LZlWkpgP2VbReFMd7OGISp5rEYrTUpWgTvPbAPL0Fi/sLXLIgCMYh/tOik0xNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlhgejSs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44509921fbcso790140f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311877; x=1777916677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VZVV57UMcCjFBLQCgq7jxMDbx4nGuPsSLCjatqjWVko=;
        b=rlhgejSsCrl6yGhFshhHoTT5TtxgWULJyuN/T4iGh03znzcY2X06lVbRcJlRUYVjeP
         HU9EaO10U9f+9RlnRuJw+XtVjgLd/JpmiGc+ZlchqwGvDx3Mp+uKCXTxq5XBq1fc1LhH
         OzUjzd8h4N/15eGOVy9Yapv+YnX9OwNpbr71XeJ3Iwn2UJHt41pB7mshtOCN4NlUNZEK
         5kDdzsaR5pydNimmMCZyPULNLV+q1yMuiRjEHL3YSWQo8lujUgp6UYyubKZBByYp1xAN
         7IQR+Mh8j6efYF8LPRbUD3VyLiNA3JrkWoQv25GPxbYjF+rv+6WlKu+vR5IlqmKclOjm
         TBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311877; x=1777916677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZVV57UMcCjFBLQCgq7jxMDbx4nGuPsSLCjatqjWVko=;
        b=f5mTtDNzv1/LHv0FTSTo5+22G8xAaQHOBe5W9eMtloRkwIPEbYOMDNHRyJzngzTjV5
         hZHur/+DAaEZDygEL2Q/+nW0DJYh2yvKFsa7W9qN0COdf6MahrO+eWmSpMQAIjBmWSAB
         wh4CzVMXFU3AI8ssF83telng+uGG2eisyF00kcKPZeip0l7Yl79OaXWoyLUR407rzKFp
         u3vTl4dkgTXEut4gw4Jt5ka05N0rwOfCBnfNeRyNMXR4qmRBKLubThvkCtXLbtwASlA3
         7fUGukHXg2gEcd38u3R9rjZwF4zgKRAfhgeEJxyrXW7nd/odMa3PRRIP+IokW0uypuDU
         vKpw==
X-Forwarded-Encrypted: i=1; AFNElJ9wNMeWty/msXUHKB+2w2iaS0k9WM6u6VdEHNGMVkaf70akQQLb0dMRKlVqNyD/Avygv/jyx/UJYQ7M2XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YykoFtWlWIhjuzx5WB0S7wJ1UbvhoYHO0G1ZQl+uy29VwUGqu5/
	+ouPojexAlYr7+SLxyDQfFI/JneBTyjRYnVSda0H1WTFA3gWzlWYq3Fe
X-Gm-Gg: AeBDievs/ytvXAGLgbWwO/k1huDF7KGManYDpwtVsmTAGiHNqZB8SitnxvQ+/5g/HvC
	E22l6rxRUTk49tCssq66tdnLKJZEd01no5VCIkehcxiFxTrvnc3E70yLWLIOefVBZvUk+NhaTOF
	h3DuXKyk2WqlfOHC7SAL0A5l0n8CaGQ3fAxb+f/MChHFSBkcZsMM79YyNqrsczY7p5NXltgRgYG
	D6kloyLx8IUbnjvzxv+3gqb34i/wX/Dh423OgTec//mvi5qT16LHivxRENWEFqucT9GDq+yEDx5
	D5sfC0qVl0AuY6CFwYMauUN2j3j2l+3E/J88CWp34065mgD256WHMbkLenzDnRztFw44aunwriY
	/KP4xbPq8EBXDU0FwOjOERaEYXoF+lVpX+i2+IHwy+38E3SZmOQnExiljM2fOt8M6iX/zIfqO1e
	TtU0lUuouc/bskQkqQykbUaVxbFwO9INHfGpj1iCHNNcYjWcej/U9QTtlSI4oi4nFRp0S4W2lNP
	pqD
X-Received: by 2002:a05:600c:4714:b0:488:ab37:b442 with SMTP id 5b1f17b1804b1-48a76f91ac6mr4075375e9.28.1777311877059;
        Mon, 27 Apr 2026 10:44:37 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774b6300sm478485e9.16.2026.04.27.10.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:44:36 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: akpm@linux-foundation.org,
	ljs@kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH 0/2] scripts: add kconfirm
Date: Mon, 27 Apr 2026 18:44:27 +0100
Message-ID: <20260427174429.779474-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 62F7B477DEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,kernel.org,lwn.net,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-12886-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi all,

Following this discussion:
https://lore.kernel.org/all/20260405122749.4990dcb538d457769a3276e0@linux-foundation.org/
in which Andrew brought up the possibility of moving kconfirm in-tree,
I've prepared this RFC to do so. See also kconfirm's introduction to the
mailing list:
https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/

kconfirm currently detects dead code (defaults, dependencies, selects, and
ranges), and includes an optional check for dead links in the help texts.

False Alarms:
kconfirm aims for zero false-positives, which is currently true for dead
code detection (as far as I'm aware - but there are hundreds to go 
through); this is not really possible for dead link checks, as this
depends on an internet connection, and we do not attempt to bypass bot
blocks. For this reason, dead link checking is disabled by default, but
I've provided an example of how to enable it. Additionally, you can view
my previous message to the mailing list with hand-verified dead links
here:
https://lore.kernel.org/all/6732bf08-41ee-40c4-83b2-4ae8bc0da7cf@gmail.com/

Current State of Alarms:
The last time I checked linux-next (next-20260427), there were 579
instances of dead code, and 81 unique dead links. The most critical check
is the dead default statements, which has surfaced a few misconfiguration
bugs (fortunately, just for kunit tests), see examples:
https://lore.kernel.org/all/20260323124118.1414913-1-julianbraha@gmail.com/
and:
https://lore.kernel.org/all/20260323123536.1413732-1-julianbraha@gmail.com/

But hopefully kconfirm can ease maintenance and we can prevent more of
these from making it into the tree in the future.

Use it:
You can test out kconfirm with this patch series by compiling and running
kconfirm like this:

`make kconfirm`

You can enable dead link checks in the help texts by
passing KCONFIRM_ARGS="--enable dead_links", like this:

`KCONFIRM_ARGS="--enable dead_links" make kconfirm`

Note that it is not architecture-specific; it runs tree-wide.
If you run it on linux-next, you should find 579 instances of dead code.
Originally this number was even higher, but many patches have since been
applied to linux-next, and included in linux 7.1-rc1. Thank you to the
maintainers and reviewers for their feedback and patience :)

You will need Rust with Cargo and an internet connection to download the
dependencies for compilation. Originally, I planned to vendor the
dependencies and submit the entirety of the code here, in-tree, but the
dependencies (and their dependencies...) are too large (somehow, a
whopping 264MB!), so instead I am proposing to add just the tool's own
code.

I've included the Rust for Linux team to discuss the build system changes,
as I'd like know if there is a better way to integrate this with `make`,
and if there's a better solution as far as the dependencies and Cargo go.

Thanks,
Julian Braha

Julian Braha (2):
  scripts: add kconfirm
  Documentation: dev-tools: add kconfirm

 Documentation/dev-tools/index.rst             |    1 +
 Documentation/dev-tools/kconfirm.rst          |  147 ++
 Makefile                                      |   12 +-
 scripts/Makefile                              |    2 +-
 scripts/kconfirm/Cargo.lock                   | 1710 +++++++++++++++++
 scripts/kconfirm/Cargo.toml                   |   21 +
 scripts/kconfirm/Makefile                     |   28 +
 scripts/kconfirm/kconfirm-lib/Cargo.toml      |   16 +
 scripts/kconfirm/kconfirm-lib/src/analyze.rs  |  593 ++++++
 scripts/kconfirm/kconfirm-lib/src/checks.rs   |  257 +++
 .../kconfirm/kconfirm-lib/src/dead_links.rs   |   63 +
 scripts/kconfirm/kconfirm-lib/src/lib.rs      |   55 +
 scripts/kconfirm/kconfirm-lib/src/output.rs   |   52 +
 .../kconfirm/kconfirm-lib/src/symbol_table.rs |  209 ++
 scripts/kconfirm/kconfirm-linux/Cargo.toml    |   14 +
 scripts/kconfirm/kconfirm-linux/src/lib.rs    |  129 ++
 scripts/kconfirm/kconfirm-linux/src/main.rs   |   74 +
 17 files changed, 3379 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/dev-tools/kconfirm.rst
 create mode 100644 scripts/kconfirm/Cargo.lock
 create mode 100644 scripts/kconfirm/Cargo.toml
 create mode 100644 scripts/kconfirm/Makefile
 create mode 100644 scripts/kconfirm/kconfirm-lib/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/analyze.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/checks.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/dead_links.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/output.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/main.rs

-- 
2.53.0


