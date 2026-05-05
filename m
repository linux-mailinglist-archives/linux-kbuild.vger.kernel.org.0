Return-Path: <linux-kbuild+bounces-13027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJqiNuIK+mlsIgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13027-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 17:21:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECCE4D01CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 17:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9C17300E737
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 15:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFB93A6B90;
	Tue,  5 May 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ctdw/c9R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C88378D93;
	Tue,  5 May 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994245; cv=none; b=Ug42b13nTTCr3aNOvf+3leuxK8XBSLK40PPhnRUszMOB2yfAoADUFa3KtTPuZoeMjqYnfgQolsHjIDQzQunxa51deD+k27Mj4cz6E3oyeQctcxGS4qmh6ilz2DK65g3IlQhiXkPuKhvmKJCpEZIlsRMkR4/60YryQebH6TliFHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994245; c=relaxed/simple;
	bh=+hn///gNIzgK8t32Pl2JGm8syh2MsyHrtXbv9Ko9oUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T43LLFeMli0mgWTzByEDIx/ivoLS4vY/BYd6ON1WDBhZURWM0UYuQoCMkDalaMzW4SGRkf++LYdSctuKdNJXN1bAXG8ZnFdQ0sibSk/QzqibtKIg7BOI1hdymsVO8NktDdaa3LhEW+tNdbxEwmU6G5A0XBC5hL0gJeuAWfl5YXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ctdw/c9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F311C2BCB4;
	Tue,  5 May 2026 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777994244;
	bh=+hn///gNIzgK8t32Pl2JGm8syh2MsyHrtXbv9Ko9oUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ctdw/c9RlOErEKGcR9wOqAVYQBeOWLIiXGshJFbGeZhzBp1wETHwcV+PDqR6dMcaf
	 29eXY1WFWYAhRkastSqAdQXplBRjpZRtzDZy/TcV1ryM0KpAIN3LsfaShbGOtkk+Hh
	 /RBi3OK8oJ3aSZXhXOEgmABTkYLZ/T8x0GAblKMD3gmGgtW1HEgpKY9Md+ndSAC/4F
	 9gFfTvlD8ZBgmuWuUVqQLhdOYtGxlPH6V0iN1O/BNk9tql/BnM/Cfehb3iKHt6p93S
	 dPnEZY5Rt/D42Qm1gdHz4YWKDBrvwu/dDkS9uPPFHl6hLtXgBZGLZhdArjrEIEozvk
	 sxA0czre+7q0Q==
Date: Tue, 5 May 2026 17:17:10 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Hasan Basbunar <basbunarhasan@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] modpost: prevent stack buffer overflow in
 do_input_entry() and do_dmi_entry()
Message-ID: <afoJ9ha8NaJl1IRC@levanger>
Mail-Followup-To: Hasan Basbunar <basbunarhasan@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260427204255.22117-1-basbunarhasan@gmail.com>
 <20260428062912.32918-1-basbunarhasan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428062912.32918-1-basbunarhasan@gmail.com>
X-Rspamd-Queue-Id: 4ECCE4D01CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13027-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 08:29:12AM +0200, Hasan Basbunar wrote:
> Several functions in scripts/mod/file2alias.c build the module alias
> string by repeatedly appending into a fixed-size on-stack buffer:
> 
> 	char alias[256] = {};
> 	...
> 	sprintf(alias + strlen(alias), "%X,*", i);
> 
> This pattern is unbounded and silently corrupts the stack when the
> formatted output exceeds the destination size. Two functions in this
> file are realistically reachable with input that overflows their
> buffer:
> 
> 1. do_input_entry() appends across nine bitmap classes
>    (evbit/keybit/relbit/absbit/mscbit/ledbit/sndbit/ffbit/swbit). The
>    keybit case alone scans bits from INPUT_DEVICE_ID_KEY_MIN_INTERESTING
>    (0x71) to INPUT_DEVICE_ID_KEY_MAX (0x2ff), 655 iterations; if a
>    MODULE_DEVICE_TABLE(input, ...) populates keybit[] densely, the
>    emission reaches ~3132 bytes — overflowing the 256-byte buffer by
>    about 12x. include/linux/mod_devicetable.h declares storage for the
>    full bit range ("keybit[INPUT_DEVICE_ID_KEY_MAX / BITS_PER_LONG + 1]"),
>    so the worst case is reachable per the ABI.
> 
> 2. do_dmi_entry() emits one ":<prefix>*<filtered_substr>*" segment per
>    matched DMI field, up to 4 matches per dmi_system_id. Each substr
>    is sized as char[79] in struct dmi_strmatch (mod_devicetable.h:584),
>    and dmi_ascii_filter() copies it verbatim into the alias buffer
>    without bounds. Worst case: 4 × (1 + 3 + 1 + 79 + 1) = 336 bytes
>    into alias[256], an 80-byte overflow.
> 
> No driver in the current tree triggers either case — every in-tree
> INPUT_DEVICE_ID_MATCH_KEYBIT user populates keybit[] very sparsely
> (1-3 bits), and no in-tree dmi_system_id has four maximally-long
> matches. The concern is defense-in-depth: both unbounded sprintf
> chains are silent stack-corruption primitives in a host build tool,
> and the buffer sizes have not been revisited since the corresponding
> code was first introduced.
> 
> The other do_*_entry() handlers in this file (do_usb_entry,
> do_cpu_entry, do_typec_entry, ...) were audited and are bounded by
> their input field sizes (uint16 IDs, fixed-length keys); their alias
> buffers do not need this treatment.
> 
> Reproduced under AddressSanitizer with a stand-alone harness mirroring
> do_input on a fully-populated keybit:
> 
>   ==18319==ERROR: AddressSanitizer: stack-buffer-overflow
>   WRITE of size 2 at offset 288 in frame [32, 288) 'alias'
>     #6 do_input poc.c:44
> 
>   Stack-canary build:
>   Abort trap: 6  (strlen(alias)=3134, cap was 256-1)
> 
> Add a small alias_append() helper around vsnprintf with a remaining-
> space check and call fatal() on overflow, matching the modpost style
> for unrecoverable build conditions. do_input() takes the buffer size
> as a new parameter; do_input_entry() and do_dmi_entry() pass
> sizeof(alias) at every call site. dmi_ascii_filter() takes the
> remaining buffer size as well and aborts on truncation. This bounds
> every write into the on-stack buffers and turns the latent overflow
> into a clean build error if it is ever reached.
> 
> Fixes: 1d8f430c15b3 ("[PATCH] Input: add modalias support")
> Signed-off-by: Hasan Basbunar <basbunarhasan@gmail.com>
> ---
> v1: https://lore.kernel.org/lkml/20260427204255.22117-1-basbunarhasan@gmail.com/
> 
> Changes since v1 (per Randy Dunlap's review):
> - Audited the other do_*_entry() handlers; do_dmi_entry() has the same
>   unbounded-sprintf shape with a realistic 80-byte worst-case overflow,
>   and is fixed in v2 alongside do_input_entry(). The remaining
>   do_*_entry() handlers were verified bounded by their input field
>   types and do not need this treatment.
> - Added a Fixes: tag pointing to the original do_input introduction
>   (commit 1d8f430c15b3, 2005).
> - Reworded the alias_append() comment: replaced "cumulative
>   bookkeeping" with "remaining-space check", which is what the helper
>   actually does.
> 
> Randy: I have not carried forward your Reviewed-by/Tested-by from v1
> because v2 expands scope to do_dmi_entry() (new code you have not seen
> yet); please re-affirm if v2 looks good to you.
> 
> ---
>  scripts/mod/file2alias.c | 91 ++++++++++++++++++++++++++++------------
>  1 file changed, 65 insertions(+), 26 deletions(-)
> 
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 4e99393a35f1..9ec5c4e1f3ed 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -651,7 +651,38 @@ static void do_vio_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, true, "%s", alias);
>  }
>  
> -static void do_input(char *alias,
> +/*
> + * alias_append() — bounded printf-append into a fixed-size alias buffer.
> + *


> + * Replaces the historical pattern  sprintf(alias + strlen(alias), ...)
> + * used across this file. That pattern silently corrupts the stack when
> + * the formatted output exceeds the destination size; the worst-case
> + * emission in do_input_entry() with a maximally-populated keybit[] is
> + * about 12x the on-stack 256-byte buffer, and do_dmi_entry() can also
> + * exceed its 256 bytes for four maximal-length DMI matches. Use
> + * snprintf with a remaining-space check and abort the build on
> + * overflow.

This is well-documented in the commit message (thanks for that!), and I
expect this to not become updated in case we run into the fatal() case
and update the maximum buffer sizes.  Thus, I'd rather not add that
stanza into the code at all.


Nevertheless, thanks a lot!  LGTM.

I am going to apply that to kbuild-fixes-unstable for some linux-next testing.

Kind regards,
Nicolas

