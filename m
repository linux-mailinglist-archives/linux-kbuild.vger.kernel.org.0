Return-Path: <linux-kbuild+bounces-12461-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qANoFHl1zGn1SwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12461-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 03:31:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5AB3737DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 03:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88BDD306301C
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 01:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E599F2D2385;
	Wed,  1 Apr 2026 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jKEW9F1G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB732D0C82
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 01:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775007023; cv=none; b=nzcUNocIRlEa5B+NC0Bx6PnHFpbchsWnq3Rk4rjnwQugyEcsAvuvPoMEw0NSpiXrPBl7tDBGtv+oqTG6GKY9GUGcx1GVKa31gVnBadGckvd3A1SWcsnMVlcBvR9wNlZglzBJBxRipDGr+FDFlPzfjKBu9Xtk65tBJMedEMkYOPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775007023; c=relaxed/simple;
	bh=31TfvCLwbknK8QU0XVOHI6FK0vdxmYqr/snmIVckegg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=suNWaRIBqJxo9hFpjTTekJBkce0hv/uWY6wN6+attLXZ1TnPqBKLT+vyvZeylSf+HmNfNoF1+z/6MLHvNre4kO6h3tsCfj1GN1ZFrJPMvQLGVX49+FKmbzhZbmkEfH7Uv869xyrP+fnQGSG3b0QWmReDRwZWqzjca67bjHLHtWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jKEW9F1G; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c68a134df8so2417020eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 18:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775007022; x=1775611822; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1/BQLq9I+ernXavRvxZYNZROQSXYmepGs6Tk+w+QVg=;
        b=jKEW9F1GtFDJu1oSrVQ4fBmh51vm0ej6HPOhm4jQHGM0AICgFsvYpC5w8JyATLvuKt
         qgGnGu59RpjSsyH4RR9wt3fFvKp7V+i9dI8RJ6ckYyfCYtrJ/zDydvrhc8O/3kJ/jjSN
         q0sJ3cCNpafYYrlmhGucxhDyn4CDKIgirsGlyfDsCHT6Rfdom+k/cHN3svkXwjCPfYXj
         94HrWnd5CHpLT88AGgNxxb0ObQ7k533Y02V3hf/sPB/E8+zey7klT4NJVuva4Pkeqakc
         cIudRDdfke5m7rVJDhxNjUxZngRaGbjfmYz1S1gdiRdk+uKztHrqcWONAKbMzGO8ZdJx
         Sjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775007022; x=1775611822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1/BQLq9I+ernXavRvxZYNZROQSXYmepGs6Tk+w+QVg=;
        b=AGu56WRYUFV9r/Z7gSQqVAo4X6udqnSy5xLWqi+kU+lr8Oq5mI3/CRGdWnv9Nw2vbi
         KCkmRLNyHnRjTDCsTiy6Wig4LR1HvkwaBwmmKEyTspjVz+tuli2FlqzCN8WDwGerV4fJ
         TOYcmLbHQJ+EJQ0fqq+SL/XJRvPnRDVn5MDMDx5zM/t+6M0PJUlPra8paUODd/ni/QrU
         F8pxaGf/6jV3/JE0PQ5GEzQmCWBF0KriZUAWLT0kfeGevj0mcXj0KWtfBOVJMuVVMFVE
         rzIfnKUqy0mv+ncYBMl8j/K4ZDhWMAr4fr12q6T9vg1GmiS1BwkVtriv6DHmyI6dPrYk
         NfZw==
X-Forwarded-Encrypted: i=1; AJvYcCXRiMe9e19PRNLg6t7b7oc/8ont07heZ/3MBguhrzawUlLimxedTd0ZrBf+TpB1tkhcwcmcffduRwthTpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfIjE4mDM4yCfqp7+tUY5WOPZymd0e/QWP894JNGhebF6s7aDU
	A8CQGjodOXWtiIK/H1YOGdRz8t4guv+e8rIqRPGjuEnx4PA3/1nE40SP0+1L5Dbhh0hq3CoY7ol
	bl1MGwwdIK1v9wqB/qEhBPKRcfVQdgg==
X-Received: from dybmh41.prod.google.com ([2002:a05:7301:f29:b0:2c3:dfe3:6dbb])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2c8c:b0:2c6:2bac:8a8 with SMTP id 5a478bee46e88-2c9333b8061mr822830eec.30.1775007021499;
 Tue, 31 Mar 2026 18:30:21 -0700 (PDT)
Date: Wed, 01 Apr 2026 01:30:19 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <177500701994.1603852.8130352881871388132.b4-ty@google.com>
Subject: Re: [PATCH v5 0/7] scalable symbol flags with __kflagstab
From: Sami Tolvanen <samitolvanen@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Siddharth Nayyar <sidnayyar@google.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, maennich@google.com, gprocida@google.com
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12461-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB5AB3737DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 21:25:01 +0000, Siddharth Nayyar wrote:
> This patch series implements a mechanism for scalable exported symbol
> flags using a separate section called __kflagstab. The series introduces
> __kflagstab support, removes *_gpl sections in favor of a GPL flag,
> simplifies symbol resolution during module loading.
> 
> The __kflagstab contains an 8-bit bitset which can represent up to 8
> boolean flags per symbol exported in the __ksymtab. The patch series
> also uses this bitset to store GPL-only flag values for kernel symbols,
> thereby eliminating the need for *_gpl sections for representing GPL
> only symbols.
> 
> [...]

Applied to modules-next, thanks!

[1/7] module: define ksym_flags enumeration to represent kernel symbol flags
      commit: 10a4eb5882ba16164ece86d99486084f02f148bb
[2/7] module: add kflagstab section to vmlinux and modules
      commit: 9743311b4535dc76ce81f46303da0f69bfaa5fd6
[3/7] module: populate kflagstab in modpost
      commit: 16d0e04f546ffba78c74bbfeb57d93147bcaf2c5
[4/7] module: use kflagstab instead of *_gpl sections
      commit: 55fcb926b6d8b5cfb40873e4840a69961db1bb69
[5/7] module: deprecate usage of *_gpl sections in module loader
      commit: b4760ff2a5e4351c59d185967735f59c0b0bd7f6
[6/7] module: remove *_gpl sections from vmlinux and modules
      commit: f18540256b70c9e1f0e26e2c38f3d43a131926d9
[7/7] documentation: remove references to *_gpl sections
      commit: 3b1299f25b07ef83e020d049dfc62ced9c09450d

Best regards,

	Sami



