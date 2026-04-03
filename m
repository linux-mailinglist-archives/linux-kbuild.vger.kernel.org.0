Return-Path: <linux-kbuild+bounces-12636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBl9OhUS0GlQ2wYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12636-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 21:16:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 536CC397954
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 21:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB3F2305022A
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 19:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E16E3D47CB;
	Fri,  3 Apr 2026 19:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rg7dpr2H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE10B35E94F;
	Fri,  3 Apr 2026 19:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775243726; cv=none; b=qcpl+/nGFtqDO2emE0y2vG9Ap3/587fAglE6H/r3/CXWxxpo6+TlyY74s2tWlbNW7erIKmX+quRCvl/FJ3rdm486ScSk7JyQVHmJzIN8xNPi8JXHr5H0wmnAj2ZUsdGV73nCPqsae+MdBkszRO4sR4CcacsZmj1wkpX0yp/vfug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775243726; c=relaxed/simple;
	bh=6qecY3n6b9STq+m2/GR/COgE8ysHOSayppqsSevTHsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QlXsOzBGbM1V3aZ4zJE8iqP4kgwhcfeKfn+3s5VNoPdGitB1a9a5zOlHiKv4U41z6P+C72wku+Es2k2jduMwubQWbOhIWrHAJi9iyyWWFrUzcDZqY4gj1joshhB6ndbn7xgf4j+iaUT0HwyASQLcYWsEFqpdubtnqrbF4NLe0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rg7dpr2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F195C4CEF7;
	Fri,  3 Apr 2026 19:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775243725;
	bh=6qecY3n6b9STq+m2/GR/COgE8ysHOSayppqsSevTHsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rg7dpr2HXjvSDR5w3cZ/+B4U4lq83NMxqiLsamEgHO943IE6QwLnI8GDCcyX6veHj
	 c023JrqmYyguqtauhzOAWejwvD4+3WTtXq0zXw7I6ie0KLxYlQPQSWfgnm1IUm162W
	 FcKjCk031Bzr+/cIWs8zYe+0OsK35wMl4CuVT6sI4eQ9dJffGoXPNnaniOn7VXTjDn
	 4j7X77zZNbvF2CWHyQjoHztDBRvVfvmhWjcrM39/P7ONv+NNO2BY01THP9xWDp1SVM
	 5VESXh24UkVT8eybDEtk280HAkp9ndbBvulyVUUwqZpSXkU5ywUQvvqr69mpi7IQel
	 /I8CZxG/j72/g==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: forbid multiple entries with the same symbol in a choice
Date: Fri,  3 Apr 2026 21:15:10 +0200
Message-ID: <177524309498.3877153.5324055967603542099.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330115736.1559962-1-masahiroy@kernel.org>
References: <20260330115736.1559962-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12636-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 536CC397954
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 20:57:35 +0900, Masahiro Yamada wrote:
> Commit 6a859f1a19d1 ("powerpc: unify two CONFIG_POWERPC64_CPU entries
> in the same choice block") removed the only occurrence of this tricky
> use case.
> 
> Disallow this pattern in choice_check_sanity() and revert commit
> 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kconfig: forbid multiple entries with the same symbol in a choice
      https://git.kernel.org/kbuild/c/e967588a

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


