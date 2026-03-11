Return-Path: <linux-kbuild+bounces-11818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IOqOIcfsWmOqwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11818-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:53:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73725E3D0
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4148A323BDD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 07:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB41D211A05;
	Wed, 11 Mar 2026 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shB4/m/k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412E23B2FF0;
	Wed, 11 Mar 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215298; cv=none; b=KqBq1kSDO+ZlcfjwXYcLoJ6/AoayEhsnDDxnBGWncsfBIue/KT8JRz7EQeZC/w70Ryr5pwFQMtgAfSYnr3G9VQTbk5lSo5/7/F0xobpB8FYUtcUMupw/LJgRNDOqUS62DIGi9CqVSNzHlMqKUqVduICiVCdR90N976ACoWrU2VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215298; c=relaxed/simple;
	bh=dvzjvU+T/oMmklrtmwx0MuSVB0iuqCrQ5p3CgpIb5Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtlnTXZrpJlKAwYR8BmbjOY7eh+CWz420j09gA9SjhmgYSKCeIZtAs481hQtIzLg0I8EOXr/uLsBFl4zTo2HDUXxqR+mY+PSkUh4j+AHcLv8ppzJjCfeN/KBcPWfDlMD4Bnb9YXaSeynKvTsfysoijJ8MbwwDwZBj2gKRjRauII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shB4/m/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF91C4CEF7;
	Wed, 11 Mar 2026 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773215297;
	bh=dvzjvU+T/oMmklrtmwx0MuSVB0iuqCrQ5p3CgpIb5Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shB4/m/ku4sQPSqcrojAt6cb+Qh4vpWc5jJoi95fMAUGlP8fCMqWb91Zk2VFEz4G7
	 IWa7GzzQqcdH/yS8zoRQlOR4w1ouW75wafPoHItQxmQk9r3chuWiR2WfJvJVoKhskS
	 KDtnHzqg8qbaUO7k1OYqVEAYXntzx7weqFYd878EXyGDso8H6XcvHV5ieBVw827g3S
	 gQh++0v7qPWWH9l7cMitEF0sCph/vu3R01iPxdhd0EAchCqIJ5+jWlPBGp47F51rTL
	 vRHOBoF9y9kcgkbQ4VbEC0yYFv7tLNlznYH5KNEUmX6+Nsx/Pk3muJ7dcb+4QS5FQ/
	 vp7ejY7glsgvQ==
Date: Wed, 11 Mar 2026 00:48:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Nicolas Schier <nsc@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH] scripts: kconfig: merge_config.sh: create tmp file for
 awk
Message-ID: <20260311074813.GA1996626@ax162>
References: <20260310105114.192327-1-mikko.rapeli@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310105114.192327-1-mikko.rapeli@linaro.org>
X-Rspamd-Queue-Id: 3F73725E3D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11818-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:51:14PM +0200, Mikko Rapeli wrote:
> From: Nathan Chancellor <nathan@kernel.org>
> 
> For some reason some awk versions/configurations fail to create
> this output file. Create it in the shell script part before
> providing it to awk.
> 
> Reported-by: Andreas Larsson <andreas@gaisler.com>
> Closes: https://lore.kernel.org/linux-kbuild/acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com/
> Fixes: 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk")
> Tested-by: Andreas Larsson <andreas@gaisler.com>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Even though it is a bigger patch, I think I prefer Daniel's submitted
fix for this issue:

  https://lore.kernel.org/20260310-fixes-merge-config-v1-1-beaeeaded6bd@samsung.com/

> ---
>  scripts/kconfig/merge_config.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 735e1de450c6..070ecae87a1c 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -123,6 +123,7 @@ fi
>  MERGE_LIST=$*
>  
>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> +touch "$TMP_FILE.new"
>  
>  echo "Using $INITFILE as base"
>  
> -- 
> 2.34.1
> 

