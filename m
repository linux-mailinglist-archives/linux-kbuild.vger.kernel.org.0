Return-Path: <linux-kbuild+bounces-12623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH1aCJbYzmmGqgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12623-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 22:59:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED438E2CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 22:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 498BC30292FA
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 20:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB25364E86;
	Thu,  2 Apr 2026 20:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmJioNlG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06A03603DF;
	Thu,  2 Apr 2026 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163538; cv=none; b=YGD7nq0nEUiXLtj6dqNInFQQK78J683kt1/ozOv8q1rTqQGuVMcDk+acdO5hLqMOlU+yuuAMCeLkiUlZxVidblaB8OMCUz9RWerrlgSiFwLMmK7t1EzifEX6t66P/c9gW8dY5TJZsdbsVLITRXqSA64YENkJltm+VGLKYdt9UyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163538; c=relaxed/simple;
	bh=8b/y+P89Cnv4PWd9BPH6CIcmr+OlgxwrF6dMRUENDeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPsNuzvY5IJY1BMlUNWHvyvoC751OLEIO43PI7DUwxkjUxHS0uSZ+zPokbi58yci11p3rP9AC3VUXId61Rx+Z8UiMDyxw3V7QXmPnhofaSwh1J0BZnL4ry2qdbFfgv4pGwNPqI3iFrHUgZuEMRqymwhJndsZju5qqKkxbiXg1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmJioNlG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A4BC116C6;
	Thu,  2 Apr 2026 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775163537;
	bh=8b/y+P89Cnv4PWd9BPH6CIcmr+OlgxwrF6dMRUENDeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TmJioNlG8ba1dkGdGK0nL2B9kvjOnTadCD0vMmZlASFiNc9pIxUPQU1qRNChsBhqt
	 kV0p8Svv9TWTkC1sDuQi0oAbmopODbook9Ac7fC0+Wzpiyt8jUEr3BqFctAn4i+EgV
	 0Pboy+a53l1+me2Ke4jjIzSYwhNdVnkWjr8uCqJ0jHOeU0oKJqFfr/qGWJ+wjXKo/b
	 2BID80YTlOLSxXTFvb3t83KcBK6wBQB3FDEzgaLAHZOYM+Ss2zrnl7fKWo707YbQYe
	 J/dqT3WKHz0YYAR2VV2qmbVToTrQvQtWBXcTCMFl5SZgSeFoIO3umHYsa8wvRjuES9
	 uPTZMxLZ3anIQ==
Date: Thu, 2 Apr 2026 22:57:14 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	"linux-kbuild >> \"linux-kbuild@vger.kernel.org\"" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
	Maximilian Huber <maximilian.huber@tngtech.com>
Subject: Re: [PATCH 02/15] scripts/sbom: integrate script in make process
Message-ID: <ac7YKs79GPfxvw5T@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Nathan Chancellor <nathan@kernel.org>,
	"linux-kbuild >> \"linux-kbuild@vger.kernel.org\"" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
	Maximilian Huber <maximilian.huber@tngtech.com>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
 <20260210205424.11195-3-luis.augenstein@tngtech.com>
 <20260330095011.GA1458050@ax162>
 <9120907b-9568-4f0e-9757-c9e3b8d530f4@tngtech.com>
 <2026033111-bolt-verse-4505@gregkh>
 <20260331153009.GA1103611@ax162>
 <acvwpv7ISJoYSttX@levanger>
 <900ee659-3663-44a7-806d-93f995224f76@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <900ee659-3663-44a7-806d-93f995224f76@tngtech.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12623-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,birdcloud.org:url]
X-Rspamd-Queue-Id: 88ED438E2CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:09:55PM +0200, Luis Augenstein wrote:
> Hi everyone,
> 
> > If sbom.py is unable to parse the build commands, does it exit with a
> > non-zero exit code, correct?
> 
> yes correct. The current behavior is to always parse as much as
> possible, collect all problems, print an error summary in the end and
> exit with a non-zero exit code.
> 
> >> The cmd macro uses 'set -e', so consider moving this up and making it
> >>
> >>     trap  "rm -rf $$roots_file" EXIT; \
> >>
> >> like try-run in scripts/Makefile.compiler does to ensure it is always
> >> cleaned up.
> >
> > hm, well.  Yes, this should do as expected, but please be aware that
> > this also kills the $(delete-on-interrupt) which is part of $(cmd) and
> > removes $@ in case of error or interruption by installing a trap --
> > which will be overwritten.  See also below.
> 
> I think $(delete-on-interrupt) only operates on non-phony targets. Since
> our target is $@=sbom instead of the generated .spdx.json files
> $(delete-on-interrupt) currently has no effect and wouldn't really be
> "killed by intention" by introducing a trap within cmd_sbom.

ah yes, correct.


> > there should be _no_ output on error, regardless of
> --write-output-on-error.
> 
> If this is a general convention we should follow, then we maybe want to
> return a zero exit code in sbom.py in case of errors when
> --write-output-on-error is set, effectively treating errors as warnings?
> Alternatively, we could keep not using --write-output-on-error by
> default. Or we don't follow the convention and write the output
> *.spdx.json files in case of errors.

I don't have a strong opnion on that.  But I think it is important to
keep make exiting with a non-zero exit code if a target fails.  As you
described above, that is the way it is with your current patch set
version; thus I am happy with that behaviour.

> I am not sure what's the most appropriate behavior here. However, we
> know that people will very likely encounter cases with commands unknown
> to the parser. It's not very useful to simply deny generating the entire
> documents, because in many cases the sbom will still be quite usable
> although less complete. For example, if the parsing error occurs close
> to the leaf nodes it cuts off only a small part of the dependency graph
> which still retains most of the information.

Ack.


> Tim Bird apparently already encountered this problem which lead him to
> manually add the --write-output-on-error flag.
> https://birdcloud.org/bc/Linux_Kernel_Missing_SPDX_ID_lines_from_build_SBOMs
> 
> 
> > The cmd macro uses 'set -e', so consider moving this up and making it
> >
> >     trap  "rm -rf $$roots_file" EXIT; \
> >
> > like try-run in scripts/Makefile.compiler does to ensure it is always
> > cleaned up.
> and
> > The common way in kbuild is using '$(tmp-target)'.
> 
> This would be the new version then:
> 
> # Script to generate .spdx.json SBOM documents describing the build
> #
> ---------------------------------------------------------------------------
> 
> ifdef building_out_of_srctree
> sbom_targets := sbom-source.spdx.json
> endif
> sbom_targets += sbom-build.spdx.json sbom-output.spdx.json
> quiet_cmd_sbom = GEN     $(notdir $(sbom_targets))

If all filenames in $(sbom_targets) are w/o path components, the
$(notdir) is obsolete.

>       cmd_sbom = roots_file="$(tmp-target)"; \
> 	             trap "rm -rf $$roots_file" EXIT; \

I don't see a good reason in the trap here, now that the roots file is a
kernel build temp file (ignored by git, removed by make clean).  Thus
I'd rather recommend to remove the 'trap' line as well as the roots_file
variable but use $(tmp-target) instead in all three places.

Thanks!

Kind regards
Nicolas


