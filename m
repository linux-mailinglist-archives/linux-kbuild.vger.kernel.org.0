Return-Path: <linux-kbuild+bounces-11427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCwsEwszn2lXZQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11427-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 18:36:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D422B19BA1C
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 18:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A0FC3029636
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 17:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77FE3B8BCA;
	Wed, 25 Feb 2026 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="hayY423g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874DC3921D1;
	Wed, 25 Feb 2026 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772040964; cv=none; b=QpwVwK6sOLjgDIjvnQIP9XZxJe2+ZcF/yhzDvkmEIMPIU6LqfTNOF2wscgWzbamIA7qgeOTAR3FkzMgVfMjPJkjDPp5aENFSe4F94KV4IOuX9fZ2DbmzoZfoPEoUFOPJRN8q/p8JVarWrQwaek5fdoclvjxyZe/b9GNX5DW3I0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772040964; c=relaxed/simple;
	bh=YRY5VNh5WJAQAaMILsab9VN7315yMrX1I852eDbxTtU=;
	h=Subject:From:To:CC:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E9/TdFH7dqXiUKqSrFi+9rSa8Iyq1u8smQ6XHciIiesQRwuO8MrjfYWjJyG/BaR4sXvwfh1OSAscqOGz3jOIyX7fqOIkzM9F2HqULTXfesT0IAwqLFrH/7cChazvBdoL+nLA9V/EzYGl/q3VIi8uLcvxa4KW3Ra12RS/0opVjEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=hayY423g; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772040963; x=1803576963;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=YRY5VNh5WJAQAaMILsab9VN7315yMrX1I852eDbxTtU=;
  b=hayY423gYfNpQdEb1njjsKucjYdX2eYQFzzawghxCT5tyolnzskmY8oN
   ByZBzQ3Rwzzm/d5KIcioFPr4BAfbMEH2e5DhcAMn9OD3i2MkiRMl2Gn+F
   ZbzxFKdxy5YhFFDVUU0+NBa7EqAUGDL3ZgnQdZyXNZKIsywI0VaIyFt9i
   pCx/5a7sYyp/wpnVxENonNLA7x+L3KJnJ0zSaBNO/Wi19vmA9VHzSdEkO
   WPCXlz2zOvVoYynbBLva4Omef6GZcemU6Lz0gjirxA5KLqHIkKw/yJ8Cc
   Gd7E0GPeXQh6lrKxsn+So7Oo/eA+LI/OiCDNdk+t83WopYxZeL+UhSdWm
   w==;
X-CSE-ConnectionGUID: 8uhsIv4TQIe9EcUHkouJpQ==
X-CSE-MsgGUID: ba3PhwdMSXS3IlmTrBGnTQ==
X-IronPort-AV: E=Sophos;i="6.21,310,1763424000"; 
   d="scan'208";a="13593227"
Subject: RE: [PATCH 17/17] Add standalone crypto kernel module technical documentation
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 17:36:03 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:1793]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.86:2525] with esmtp (Farcaster)
 id 93693ec8-671a-42a3-87bc-f5a3c251f9ed; Wed, 25 Feb 2026 17:36:02 +0000 (UTC)
X-Farcaster-Flow-ID: 93693ec8-671a-42a3-87bc-f5a3c251f9ed
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 25 Feb 2026 17:36:00 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 25 Feb 2026 17:35:59 +0000
From: Jay Wang <wanjay@amazon.com>
To: <ebiggers@kernel.org>
CC: <bp@alien8.de>, <catalin.marinas@arm.com>, <davem@davemloft.net>,
	<herbert@gondor.apana.org.au>, <ilya.okomin@oracle.com>,
	<jay.wang.upstream@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<linux-modules@vger.kernel.org>, <mcgrof@kernel.org>, <mingo@redhat.com>,
	<nathan@kernel.org>, <nsc@kernel.org>, <nstange@suse.de>,
	<petr.pavlu@suse.com>, <tglx@kernel.org>, <vegard.nossum@oracle.com>,
	<wanjay@amazon.com>, <will@kernel.org>, <x86@kernel.org>
Date: Wed, 25 Feb 2026 17:35:45 +0000
Message-ID: <20260225173551.8704-1-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225015517.GA162634@quark>
References: <20260225015517.GA162634@quark>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D032UWA003.ant.amazon.com (10.13.139.37) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.66 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alien8.de,arm.com,davemloft.net,gondor.apana.org.au,oracle.com,gmail.com,lists.infradead.org,vger.kernel.org,kernel.org,redhat.com,suse.de,suse.com,amazon.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11427-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[amazon.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D422B19BA1C
X-Rspamd-Action: no action

Thanks to everyone who has taken the time to review and comment.

Based on the discussion so far, it seems the core question is whether this feature is appropriate for upstream at all, or whether it should remain entirely downstream.

We’ve discussed this with a few folks, and to help clarify the discussion, let me outline what is actually required to use this approach and what the community would gain from upstreaming it:

1. Maintaining a crypto snapshot (for example, a source code snapshot used for streamlined FIPS re-validation processes such as NSRL).
2. Maintaining the loadable crypto build infrastructure itself (i.e., this patch set).

For (1), since this requires maintaining a specific snapshot, we acknowledge that this is inherently a downstream responsibility. We are not expecting upstream to provide or guarantee a stable in-kernel API (to clarify, a stable ABI is not strictly required here, since the crypto module can be rebuilt against newer kernels and still benefit from FIPS through the shorter NSRL re-validation process of roughly 3 months, compared to the full 12–18 month certification cycle). The upstream crypto subsystem should continue evolving independently.

For (2), since this feature mainly serves as infrastructure and is of interest to multiple distributions, upstreaming it could help reduce the effort each distribution would otherwise spend maintaining similar infrastructure patches independently.

We’d love to hear more thoughts on this. If the general consensus is that the downsides outweigh the benefits of merging this into mainline, we are happy to maintain it in a separate repository tracking the latest mainline and stable releases in order to keep the work publicly available.

Thanks again for taking the time to read and discuss this.

Jay

