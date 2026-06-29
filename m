Return-Path: <linux-kbuild+bounces-13904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 250sKvdFQmrV3QkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13904-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2026 12:16:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F06D8C81
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2026 12:16:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IApwJdU2;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13904-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13904-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D19330048ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2026 10:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36F23C1402;
	Mon, 29 Jun 2026 10:11:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B836212F;
	Mon, 29 Jun 2026 10:11:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727874; cv=none; b=VGIDpFR/EoVHd+HHZi4xzBND6VKwAIm8qfQ3F/z//zmebNLTtsyM8WYtuPXOeO4U624spqCGUcfsY0opfvWYn/TRFsezqEjKFzC8L4+eBfl4hvOgyUSbTfeTYHrSMoOruxrjmd5s61R64qUrCjtSI7Y1g8Teu20vxtaJCtDr8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727874; c=relaxed/simple;
	bh=4NV9RnqHoE/dp7UpBOxG6wmam3Ajuw+usvU+oNeaO+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkr4kmJjcuePabngaoAvxfhPOGxtSJnby7dccR+QthGoHRzedeZnqWLErBgLrujYrEDNcZ39Ytgi/F3iDKT/Hdffoqyn0ATyfwanNAiSQKGRRAkhIndKtufcenEHPrkR069cCu9fz0/mc/3doi1VkwiG9d43/8f+wDXCeHB4VBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IApwJdU2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8F61F000E9;
	Mon, 29 Jun 2026 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727873;
	bh=718T54Qng3Y2sDbIyf9X3jGtl0LaVvw6Tvzl0ce34lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IApwJdU2ZqWbajkTtMUzZ8hkIf1kIkY7rKk4nIGl0N4M7Q4h6kMSQeu1mxubo6xBo
	 p/cTwNO/brR3cY9fbWfDHc+UtI+7TwhcbWs9dt6NMezFP0mW7xKcRv3hxEMQHZa9z4
	 JxP6jTi/F4VqZEzqNWZHIXk8sM1x/6klaIX8SWi0HynOg+POCH9YkDR8gUDGdRDTw5
	 NrfvLOtng09tH/oRFtUZ6qVzGBqbnR8zHTswRMC6beDaAQC90Kf7i5lTDGRFLogITD
	 i8g9TB1hE6wM4emGS8/s1XOj8nxYUUDoUHnangvfzgeg6eaC9IBBjWYeiS8mWe+ygY
	 K/7gt5xug2HNw==
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v5 0/5] gpu: drm: nova: enable calling into nova-core
Date: Mon, 29 Jun 2026 12:11:04 +0200
Message-ID: <20260629101104.2971305-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
References: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13904-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F5F06D8C81

On Mon, 22 Jun 2026 22:30:06 +0900, Alexandre Courbot wrote:
> [PATCH v5 0/5] gpu: drm: nova: enable calling into nova-core

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/5] gpu: build nova-core and nova-drm from drivers/gpu/Makefile
      commit: ca524e273c43
[2/5] gpu: nova-core: export Rust symbols for nova-drm
      commit: 3b7b7ad78fd2
[3/5] gpu: nova-core: emit Rust metadata for nova-drm
      commit: 0dc79ddc9f6f
[4/5] gpu: drm: nova: depend on nova-core and use its symbols
      commit: f1bd7119ac4c

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.

