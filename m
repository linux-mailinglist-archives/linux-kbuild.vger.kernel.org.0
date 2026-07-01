Return-Path: <linux-kbuild+bounces-13918-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XavBE8RqRWp4/goAu9opvQ
	(envelope-from <linux-kbuild+bounces-13918-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Jul 2026 21:30:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4454B6F0DBC
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Jul 2026 21:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SVJGMj+P;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13918-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13918-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64C653006985
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2026 19:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98B33B42F5;
	Wed,  1 Jul 2026 19:30:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AA7391E60;
	Wed,  1 Jul 2026 19:30:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934206; cv=none; b=sLT3+frbdPwA71/7GCZPkt96biKDNrwdzketm+kGv9OER5mXO6XjfskJ1IDbUmUg/MFqQATg3Imy4XHSFq5KhtSoTNhAJ7YDvqygmSXGS6+io/raeyaoMOtaXgn6BezvVxkAFg8bswtyv7OGLCfGcf5kqP7PyFgZb9hxTePaji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934206; c=relaxed/simple;
	bh=Ng4JK/soXLWRpzbjD29o5BbqJKZoZLQgcfAvz/N8Up0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LV53aNDXVRQzD1/iRglncUwT+irKA5GUUsKZyIKLZHZb8k6Fjqx5vXm2diYoI0uDikGN68qCBOwhT8QQ+sQPaGHBVFuabozj4cPXcODXpur4IsbVnK6qUvrjNs+2nAXInt319G/kDx2o+HodKqz/xoy+67BVN0r5eFslfVL6BMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVJGMj+P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E4E691F000E9;
	Wed,  1 Jul 2026 19:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782934205;
	bh=lWiFZEHyRzD59TqfLFkopBI9Chn0g1KOvTkDIM0N5YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SVJGMj+P4H+dPiVpSmVpwuTNjZ/uk/LYg23NULeGVvx7HDzm2UMiH8YbJqtAmWid6
	 x6F9Q8tKV4XvOWuIvseGMAvbGdzARogailcxW1TRs0UkQcUSDSr4tqUpAHgk03vCLP
	 dPpGNpcD+4v9mIqe0GXi5h27RuVbwGnJFolyjyC7aG37UAjS+Zal6L9JDC5bxU6/hv
	 APNKai4wdXWvBZhJjD1qIQumIqQ8guFKUyljHx+xuWAVUuSl2rRc6KKbv/2ZYomqna
	 AGzux1K+iw5lpzu7YDgQYdYd2QLvTiCirH3uSIXnLAgEe0eaanKQCDpRl1JLMPWCi4
	 D0TdAdWB70u9A==
Date: Wed, 1 Jul 2026 21:01:54 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Sergei Litvin <litvindev@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, nathan@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, ojeda@kernel.org
Subject: Re: [PATCH v4] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope"
 command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
Message-ID: <akVkIrcpNxZrrfii@levanger>
Mail-Followup-To: Sergei Litvin <litvindev@gmail.com>,
	miguel.ojeda.sandonis@gmail.com, nathan@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, ojeda@kernel.org
References: <20260601211850.3378-1-litvindev@gmail.com>
 <20260602121521.11650-1-litvindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602121521.11650-1-litvindev@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:litvindev@gmail.com,m:miguel.ojeda.sandonis@gmail.com,m:nathan@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ojeda@kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-13918-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4454B6F0DBC

Hi Sergei,

On Tue, Jun 02, 2026 at 02:15:21PM +0200, Sergei Litvin wrote:
> PROBLEM
> 
> (1) When executing the command `make COMPILED_SOURCE=1 cscope`, the
> `cscope.files` file generated by it includes filenames with the
> extensions *.rlib, *.rmeta, and *.so (taken from *.cmd files, which, in turn,
> are generated from *.d dependency files by the `fixdep` utility).
> 
> (2) When executing the command `make cscope`, the `cscope.files` file generated
> by it includes only filenames with the extensions *.h, *.c, *.S and not includes
> filenames with *.rs extensions.
> 
> SOLUTION
> 
> (1) Modify the regular expression in the `all_compiled_sources()` function so
> that only files with the extensions *.h, *.c, *.S, and *.rs are accepted.
> 
> This causes `make COMPILED_SOURCE=1 cscope` command to generate the
> `cscope.files` file that contains only files with the extensions *.h, *.c, *.S,
> and *.rs.
> 
> (2) Modify the functions `find_arch_sources()`, `find_arch_include_sources()`,
> `find_include_sources()`, and `find_other_sources()` so that they can accept an
> unlimited number of filename patterns as parameters for the search. Add the
> `setup_name_pattern()` function to convert these filename pattern parameters
> into a list of parameters that can be passed to the `find` utility via the new
> `pattern` variable.
> 
> This causes `make cscope` command to generate a `cscope.files` file that
> contains *.rs files along with *.h, *.c, *.S
> 
> Signed-off-by: Sergei Litvin <litvindev@gmail.com>
> 
> ---

thanks for the patch, the actual diff looks good to me!  Just two formal
nits:

1. Your patch contains two reasonable fixes that are valuable each by
themselves; in general it's better to have single patches for single
logical changes.  That helps also for the second nit:

2. The subject line is too long:
Documentation/process/submiting-patches.rst recommends 70-75 characters
with regard to workflows and tools; splitting simplifies writing short subjects, e.g.:

  scripts/tags.sh: Prevent binary files appearing in cscope.files
  scripts/tags.sh: Add support for rust source files


Kind regards,
Nicolas

