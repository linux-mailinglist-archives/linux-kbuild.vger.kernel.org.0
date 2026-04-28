Return-Path: <linux-kbuild+bounces-12899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMBYOt1u8GmgTQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12899-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 10:25:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B436A47FFB0
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 10:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2A923028B41
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 08:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7106737C924;
	Tue, 28 Apr 2026 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ycz0PXhb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C346C374728;
	Tue, 28 Apr 2026 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364605; cv=none; b=J3i2McJx917A9yNXrt56/GlyNbs87ZPxjpuF0GOxB2Vo0D6M10XBr8tG8DKHCNJ9HCZM/ZqfiV/scfynb8y7x06K/25UiUG4ZPd6H5PM9MKNnpRBmcHFFRBxpjClfGdbfRwGMtbHIXSVwtZunPYPbRtEr6A2FNZ0PZEqwBD99g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364605; c=relaxed/simple;
	bh=fdxQNMJ8DteAEC6lJuD6ziGdJ6VyO6X9vyE27maFI7k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oqTpMBKZk9aZ9KdlcbotH93JUcTCgUoFqbYC++mtiWo4NzxeuZ0MTwEqsdPvupgz36CAYg7F6gFVbtvMMZ+dqvrNnumzbiz+ZqLwXNAKGBoUnzaOPtI+djliaj3a2F661e8yZ7qJxN05kpVODozQMJOuLfr17hr1fz/kUl/28js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ycz0PXhb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777364603; x=1808900603;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=fdxQNMJ8DteAEC6lJuD6ziGdJ6VyO6X9vyE27maFI7k=;
  b=Ycz0PXhb4PglTRipuvLpl9lUbigztv69BnZhVyOQ9qdeQTayJ70cJOZi
   mfSK0+myHrZiqI72EYtcGiW2o1kZvzRufQTFJpjl2nHOlNNDRB+hZ6DO7
   xd5ExfNStsmTDtoDgQqzNrAMbP+rCZh9Ch4w69+IfdD/U0huAmL71oxFf
   uO5jVFLHBnJQR0FuRlSOYmkvcmJPx0Kr3+RYOL5ePOTgFxCNNj+LmpNgb
   cZpZFz0MmJACJqCD1OuU5aj5Jto9+SO2qyVoMRBQpP8bZPn7Boqu7/C2P
   dAfjykPTb64XiFhKOA8VJ3wiQTtBUdEOb0huHbiMNxA5g9vskNbxOXVRm
   A==;
X-CSE-ConnectionGUID: YhpZa7yWSEeH+/giZK+3XA==
X-CSE-MsgGUID: qmCYb+NTS7qv84193LuDoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77430654"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="77430654"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:23:23 -0700
X-CSE-ConnectionGUID: vzc1/MrORLycys6GtvOOeQ==
X-CSE-MsgGUID: miiEUw/WRjaxAT5U0lnsjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="233760483"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:23:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Julian Braha <julianbraha@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Julian Braha
 <julianbraha@gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
In-Reply-To: <20260427174429.779474-3-julianbraha@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
Date: Tue, 28 Apr 2026 11:23:16 +0300
Message-ID: <dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: B436A47FFB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,kernel.org,lwn.net,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-12899-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, 27 Apr 2026, Julian Braha <julianbraha@gmail.com> wrote:
> Add usage documentation and a brief description for kconfirm to
> Documentation/dev-tools/
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  Documentation/dev-tools/index.rst    |   1 +
>  Documentation/dev-tools/kconfirm.rst | 147 +++++++++++++++++++++++++++
>  2 files changed, 148 insertions(+)
>  create mode 100644 Documentation/dev-tools/kconfirm.rst
>
> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
> index 59cbb77b33ff..130ebc0d7282 100644
> --- a/Documentation/dev-tools/index.rst
> +++ b/Documentation/dev-tools/index.rst
> @@ -40,3 +40,4 @@ Documentation/process/debugging/index.rst
>     autofdo
>     propeller
>     container
> +   kconfirm
> diff --git a/Documentation/dev-tools/kconfirm.rst b/Documentation/dev-tools/kconfirm.rst
> new file mode 100644
> index 000000000000..6ad02de15031
> --- /dev/null
> +++ b/Documentation/dev-tools/kconfirm.rst
> @@ -0,0 +1,147 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +.. Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
> +
> +========
> +kconfirm
> +========
> +
> +kconfirm is a static analysis tool for the kernel's Kconfig system.  It
> +checks the entire tree-wide Kconfig, and reports misusage like
> +dead code.  In the case of dead default statements, these can be a
> +significant code smell.
> +
> +kconfirm has an optional check for dead links in the Kconfig help texts.
> +Since this has a high potential for false positives (due to websites
> +blocking bots) and slows down runtime signficantly, it is disabled by
> +default.  However, an example of how to enable it is included below.
> +
> +kconfirm is written in Rust and lives in ``scripts/kconfirm``.  Other
> +than the dead link checks, kconfirm aims for zero false positives.
> +
> +**NOTE**: kconfirm does not modify or compile the source tree; it is
> +strictly a static checker.
> +
> +
> +Getting Started
> +===============
> +
> +
> +kconfirm's Minimum Supported Rust Version (MSRV) is v1.85.0, because
> +it uses Rust edition 2024, and this is the earliest supported version.
> +
> +kconfirm also requires the Cargo package manager and an internet
> +connection for compilation of its dependencies.
> +
> +If Cargo is available, kconfirm can be built and run from the top of the
> +kernel source tree::
> +
> +    make kconfirm
> +
> +The compiled ``kconfirm-linux`` binary will be available in
> +``scripts/kconfirm/target/release/``.
> +
> +The default checks currently cover dead code analysis.  ``dead_links``
> +must be turned on explicitly with ``--enable``; conversely, any default
> +check can be turned off with ``--disable``.  Both options accept
> +either a comma-separated list or repeated flags, so the following
> +two invocations are equivalent::
> +
> +  kconfirm-linux --linux-path . --enable dead_defaults,dead_links
> +  kconfirm-linux --linux-path . --enable dead_defaults --enable dead_links
> +
> +
> +
> +Options
> +=======
> +
> +**NOTE**: kconfirm's arguments must be provided in the ``KCONFIRM_ARGS``
> +environment variable if running with ``make``. See `Examples`_.
> +
> +Available options:
> +
> +``--linux-path PATH``
> +    The path to the linux source tree to analyze. ``make`` uses this
> +    option to pass the current linux tree, but this option can be used
> +    when running the tool directly with another source tree.
> +    See `Examples`_.
> +
> +``--enable CHECK[,CHECK...]``
> +
> +    Enable one or more checks in addition to the default set.  May be
> +    given multiple times, or as a single comma-separated list.  See
> +    `Available checks`_ below for valid names.
> +
> +``--disable CHECK[,CHECK...]``
> +
> +    Disable one or more checks from the default set.  May be given
> +    multiple times, or as a single comma-separated list.
> +
> +``-h, --help``
> +
> +    Show the help message and exit.
> +
> +``-V, --version``
> +
> +    Show version information and exit.
> +
> +
> +Available checks
> +================
> +
> +Each check has a string name that is accepted by ``--enable`` and
> +``--disable``.  Checks marked *(default)* are enabled unless turned off
> +explicitly.
> +
> +``duplicate_dependency`` *(default)*
> +
> +    Reports duplicated ``depends on`` entries on a single Kconfig symbol.
> +
> +``duplicate_range`` *(default)*
> +
> +    Reports duplicated ``range`` entries on a single Kconfig symbol.
> +
> +``duplicate_select`` *(default)*
> +
> +    Reports duplicated ``select`` entries on a single Kconfig symbol.
> +
> +``duplicate_default`` *(default)*
> +
> +    Reports duplicated ``default`` entries on a single Kconfig symbol.
> +
> +``dead_default`` *(default)*
> +
> +    Reports ``default`` entries that can never be selected, for example
> +    because their condition is unsatisfiable.
> +
> +``dead_links``
> +
> +    Reports broken URLs found in Kconfig help text.  Because this
> +    performs network requests it can be quite slow, and is disabled by
> +    default. May also have false positives.
> +
> +``style``
> +
> +    Reports opinionated style issues in Kconfig files.  Disabled by
> +    default.

Oh, I'd really like a check on this part from kconfig-language.rst:

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

i.e. warn on selecting visible symbols or symbols with
dependencies.

Yes, it's going to produce tons of warnings. But currently we don't even
know how bad it really is.

BR,
Jani.


> +
> +
> +Examples
> +========
> +
> +Compile (as needed) and run on the current tree::
> +
> +    make kconfirm
> +
> +To additionally enable dead-link checking::
> +
> +    make kconfirm KCONFIRM_ARGS="--enable dead_links"
> +
> +To disable a check (here, ``duplicate_dependency``) while keeping the
> +rest of the default set::
> +
> +    make kconfirm KCONFIRM_ARGS="--disable duplicate_dependency"
> +
> +To run the default checks against a kernel tree separate from the
> +current directory, such as ``~/repos/linux``::
> +
> +    scripts/kconfirm/target/release/kconfirm-linux --linux-path ~/repos/linux

-- 
Jani Nikula, Intel

