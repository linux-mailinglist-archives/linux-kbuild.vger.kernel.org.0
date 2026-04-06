Return-Path: <linux-kbuild+bounces-12698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIaDAoIK1Gk1qQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12698-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 21:33:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BFD3A6A61
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 21:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5179E3008D25
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 19:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E33396593;
	Mon,  6 Apr 2026 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZgXA6u/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF5D277029;
	Mon,  6 Apr 2026 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503942; cv=none; b=MrrNCiz7wtJUi6SY1W7G1SCM6t6uOxsmrNAaJ1reew+4AtGE1eoBVTQl6ptlslGE4qKmnbZF6fmQP/3MRBXWuZ7jQQKbJJmIDaGY9dO+vvcpuTtlXiU7WCaOFNhkoYWqi8hg5oscI2s9dTeX3qYYf2XZLHnf5zhsL74mSn6itO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503942; c=relaxed/simple;
	bh=S1NtRgmwq+0XbhEiNinw7Ck9uZDk1ciSXDTvz8fK038=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drd3fJqYVpy55Ff7h/3fwl97e76qa6xMRAIsHsiZ40yMuBh/WJ6u+ObxzDs9MiyYKuldVXelkXs0W5SwmPMA3P/xmpIfXXYzu42pJRqtf267SJHjCvoirP4K4VNigL0Pwxd1WiZDoAASS6acUSM1upO9xKXJ6L33P+elx6EdMuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZgXA6u/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE19C4CEF7;
	Mon,  6 Apr 2026 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775503942;
	bh=S1NtRgmwq+0XbhEiNinw7Ck9uZDk1ciSXDTvz8fK038=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZgXA6u/Rbx6lf/95MWpUXpuI2+lS6JsMpaLTOjqAAppxZXy9cxUfM3m4nZHoXgci
	 MmRiIXUjP3/joOORsIt3iCmgJpoeOScCPNDPpXaaHRg/YA8YY5T/ZNDKPqY/mniQ9Y
	 rJ3xnZ+Xwa45BAPEaZopp8jUaKPZLi30umCLkATvD3qs4G6rp1axN2uhx12d0TamBP
	 7nLo0JLUYntAcFMSktSd9rhbyaJY1a18urvKHjqMJWPAqIr2fupe5TyEZDk3xovGul
	 LKv3HhIajyijJO90T3efA6twfKyV0Si/65B5nkygmZsoVbdECwN5g5e+mmLQ4Lubiw
	 5vdyu0tuILU0g==
Date: Mon, 6 Apr 2026 12:32:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Li Wang <liwang@redhat.com>
Cc: nsc@kernel.org, akpm@linux-foundation.org, david@kernel.org,
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] selftests/mm: clean up build output and verbosity
Message-ID: <20260406193216.GA1319599@ax162>
References: <20260331094402.144131-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331094402.144131-1-liwang@redhat.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12698-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2BFD3A6A61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 05:44:00PM +0800, Li Wang wrote:
> Currently, the mm selftests build process can be quite noisy.
> 
> First, it leaks raw compiler errors during the liburing feature probe if
> the headers are missing, which is confusing since the build system already
> handles this gracefully with a clear warning.
> 
> Second, the specific 32-bit and 64-bit compilation targets ignore the
> standard kbuild verbosity settings, always printing their full compiler
> commands even during a default quiet build.
> 
> Notes:
>   Andrew mentioned he hopes this patch merge into kbuild tree, so I resend
>   to linux-kbuild@vger.kernel.org.

Kbuild does not maintain anything in tools/, so this should go through
either the mm tree or the kselftests tree.

> V2:
> 
>  - Drop 2/4, 3/4 from v1 to v2, since Andrew wasn't able to confirm the
>    patch works for the rarely happening issue now, so I decided to just
>    hand on the process of the parallel issue.
> 
>  - Refine the 4/4 patch only to hide compiler errors when missing liburing.
> 
> Li Wang (2):
>   selftests/mm: respect build verbosity settings for 32/64-bit targets
>   selftests/mm: suppress compiler error in liburing check
> 
>  tools/testing/selftests/mm/Makefile        | 9 ++++++---
>  tools/testing/selftests/mm/check_config.sh | 2 +-
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> -- 
> 2.53.0
> 

