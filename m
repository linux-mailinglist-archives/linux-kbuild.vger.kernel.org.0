Return-Path: <linux-kbuild+bounces-13444-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IExTDv65HWoedQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13444-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 18:57:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932E622E6E
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 18:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41143305A5C2
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 16:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA1031985D;
	Mon,  1 Jun 2026 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jkam.dev header.i=@jkam.dev header.b="mEwQRwwV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender-op-o4.zohocloud.ca (sender-op-o4.zohocloud.ca [199.67.87.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEEC24BBEB;
	Mon,  1 Jun 2026 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=199.67.87.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332670; cv=pass; b=roXM8x/X/Lpx591oP0vj9m3a4l+Akyg8WsNBPpVi2GifyeAQZ5ZccV3GHzvZ5mFWSRqMcocN4zJDhIrxD1PGJP71hhp/oEj6WHIOnwWJ4Ojvty+mHDYhbyAD+ibvQ+1b7rshrMzdRI7YNJgUJrM5wwqkrftEY0wOk5zJUOnp7pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332670; c=relaxed/simple;
	bh=/98cak+K1W+v9kmT2+BjH0V/L1Bt/iS/hJ3WTqx95zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPjOaC0HKZOGZoRVpCItGWp2BaHZCfj6ZWzfnO2EmTlLou+47ze6r+84Ij2Nr7YCvCw9oxK2O/N3jwYBopHlpFwMtyRHp+a97KraTPGCvrN5mvzxhXD8UgSl0iHJqqGEQmjH/RDU90ZdmYpKm6vaxFIPOAf7R6QUn9dDAbM1zko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev; spf=pass smtp.mailfrom=jkam.dev; dkim=pass (1024-bit key) header.d=jkam.dev header.i=@jkam.dev header.b=mEwQRwwV; arc=pass smtp.client-ip=199.67.87.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jkam.dev
ARC-Seal: i=1; a=rsa-sha256; t=1780332654; cv=none; 
	d=zohomailcloud.ca; s=zohoarc; 
	b=V540/E5OxHO7tCYmmWw2+eHFHwrgGoL5lTSkHfPJ5bWr0MTW0jvUU2H11AfzTd+LQJUAA/U91DNsh4L/JeKntuRGH4gZx885wG1eH7aioLJcbA6hEV0Eo3KV5cdwC+o+NDaLI9QgOUMBIfSt/Y3sJPg9HSR3OKV/qOcvQmZazFM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomailcloud.ca; s=zohoarc; 
	t=1780332654; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4wCrcY8CAj2WLruzXEjhaKILgyLbRJuG1s/jfYwl/DM=; 
	b=kyMKd2QutgmOWB5LLUtxPd4GyxOKcaz6I2vSs7HYc8GOpuxrOrN0fyhD+d34OH+SV/PZgARjGQwcNE6JXVPjf/64jZ5p6bVQNqKUJ0j+XNnukdPRr75rVtUebvNL7ETFH27dVjzKwjhWSmZ8tTGgIO39lUx/F6ZSd1E67WLGups=
ARC-Authentication-Results: i=1; mx.zohomailcloud.ca;
	dkim=pass  header.i=jkam.dev;
	spf=pass  smtp.mailfrom=contact@jkam.dev;
	dmarc=pass header.from=<contact@jkam.dev>
DKIM-Signature: a=rsa-sha256; b=mEwQRwwVGTjjF0fU8oXapVkAUa4PjBeRzjCuhkDg3z4sFVEmXG3VBCAOthgqW5d9PgR2NZlmmRr4TRlufz+ZOZja1AS/mZeUC6mM6D0CBq/30U8reW+hdCokFkiRIS0iM07Pu6li6Z4D8RhpZJK+strZP9lr1axxgwdfGo4mNd4=; c=relaxed/relaxed; s=zoho; d=jkam.dev; v=1; bh=4wCrcY8CAj2WLruzXEjhaKILgyLbRJuG1s/jfYwl/DM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:References:Resent-Message-ID:Resent-From:Sender:Subject:To:Feedback-ID:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by mx.zohocloud.ca with SMTPS id 1780332653720379.08136822024915;
	Mon, 1 Jun 2026 12:50:53 -0400 (EDT)
From: Joel Kamminga <contact@jkam.dev>
To: contact@jkam.dev
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
Date: Mon,  1 Jun 2026 10:50:42 -0600
Message-ID: <20260601165042.8450-1-contact@jkam.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530184944.10459-1-contact@jkam.dev>
References: <20260530184944.10459-1-contact@jkam.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [1.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_REJECT(1.00)[jkam.dev:s=zoho];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13444-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,garyguo.net,vger.kernel.org,umich.edu];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[jkam.dev];
	NEURAL_SPAM(0.00)[0.855];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@jkam.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[jkam.dev:-];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,jkam.dev:mid,jkam.dev:email]
X-Rspamd-Queue-Id: 8932E622E6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-30 12:49, Joel Kamminga wrote:
> This cleans up files generated by rustc compiler in the case of an
> error containing an excessively long type name that doesn't fit in
> a single line. Such types appear relatively frequently so the risk
> of generating these files certainly exists. These files are purely
> compiler artifacts and are not created intentionally by the build
> system. They should be added to the `clean` target to stop from
> cluttering up the source tree.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1236
> Signed-off-by: Joel Kamminga <contact@jkam.dev>
> ---

CHANGELOG:

Changes since v2 (https://lore.kernel.org/linux-kbuild/20260529205529.75586-1-contact@jkam.dev/):
- Change commit title to be more imperative and more heavily scoped
    'kbuild: clean `*.long-type-*.txt` files' -> 'kbuild: rust: make
    `*.long-type-*.txt` a target for cleanup'


Changes since v1 (https://lore.kernel.org/linux-kbuild/20260529203426.65189-1-contact@jkam.dev/):
- Replace `Reported-by` tag with a `Suggested-by` and `Link` tag to reference back to the
  related GitHub issue

