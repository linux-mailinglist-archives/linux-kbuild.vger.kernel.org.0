Return-Path: <linux-kbuild+bounces-11752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP/LEqR4r2kXZwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11752-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:49:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA91243CBA
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A389830233EE
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 01:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9504E2E1F02;
	Tue, 10 Mar 2026 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBqUTmIh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EDB2E06ED
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 01:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107361; cv=none; b=arE8Z/1YHqXYdnnurp1mHcUxDAQEwNZZ4f5s1pahDQGSfOBC5GLCc81F0jrymBYI7L899kB3puK+alYCXo+acFp61zF85GZnw0TotkEBdVmgjJrv0Th8v6UJ8KfDenwMOMw6h4Klm4MTGvi+pISyxCshmaD8HLEhoKOSZ1Jt5C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107361; c=relaxed/simple;
	bh=MQzXH+q483kSine/yjPhrd7RaOjybW4BiVHp8LMgCeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4vrPtTIivyFV43litnDT3GFaHH+BYdJ2PBelczXKD/ITV3yjYx/cdwjIPxdnDHQUvQhm+GfRulLQOgBGbPFDz3RulraB0BqKBI40hXNhwcJRYVKFIKQBf7rx54hM+SnkjkMOzrY6pO+LTaXSRpqs6NNZGnx64uD14dOf8ncYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBqUTmIh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853aec185aso14531795e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 18:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773107358; x=1773712158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIR5qKOvvCpddCKBXBjcaQK4ei/G3JDRlsHKzqiQJW0=;
        b=NBqUTmIhKgjobwbDWpiYg61gXeMnTcwcYEjV+LcI58stvIWL6+dmtURZsVv6tDO1ws
         OSZZQuj4gbiFxCUBDed0Qzcd+qYs/guUkeSlXhx0vZm8M18Uf7jfgaojJzLPJ76MbnPt
         HWQ45qZuK4td2Y7x3RP/OsFXcHPBZ71IIoVRNGcdFhLoSl2oKcVsUarvN3kSvwvPmdyj
         OLSlaVa6upZ3MYcd4eWsaUroY8d+TuAoPz0yjOTCPLgsb3DNjnmbKAHM2JI3Mox1KveH
         ytWeERQpaTpwhRro36vOU7pXk/xcuHzO0QkpxaCwAvig+2eXvyz+IxmYQrOboDQvbxRH
         lbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773107358; x=1773712158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIR5qKOvvCpddCKBXBjcaQK4ei/G3JDRlsHKzqiQJW0=;
        b=uit/ix6I36012Ls+JVWUUpIPC40abluZyzMQaId2XGSFWnk4oMqaU29B82+7x0pc8y
         Gv4WWj1VC1DszrDnaW0U7vlQ5rl/hcD0RCqIEcYeFEgqCzVmQFww30ClKcuwqskc9lZx
         cu5XVUrfn2mgRb0K7ovWetP4d66p3xfCp/d+idGLsGhDuBKKOnFLhfOq8bNtdFXFZVnv
         PFlhccNyl7pY/lzn63366+7ZFfZRmIyTJL5qPQKW+A2DxwgUz7AW3yZSN6TwnBqToGnU
         HxPVIIJWeGmA2fFcXaU5vlbTD7p8mZ98hhASYGisoyuh2SfuWVf6x7JpvPOKU34//tJn
         6WeA==
X-Gm-Message-State: AOJu0YyBZnxNWt9qnlI/lCmMrJJUr4cmZyxO0oda0ansbOAdBcgU71VE
	IDZO6P4vKULRubpK+Qh6Aa1K7C/ng6yJy0rYM/K0/pzA/6x0NY+kKeeX
X-Gm-Gg: ATEYQzx1ZJxvDf3rePHXvdoywRuFDuXpIK0ePwFCnKuWpsI9PsR29/e3aGPfPdVqLMh
	ALjVhnofcAXQD3IhK5PsqVqWGe18DFxDK82omiBfUMmDRz/RxWhPqvPkLjLJ2UQfyJ9JMJJjDSD
	qYtqiA7YIADZyURcsM7cwoQ2grZ07y8pdjItB57qtVEQQWFZqXJ4iV789dXgM0q6J9sBO8Q/3Uj
	0SqFZVOat3tgGFIzHpKMWBkMoEHOlUzWa0ZPaTtr7mlqur1Hn5ZdfiBm7lhkwpxxmvPKbRfZjrd
	OQm9TUKdRVml+GktWRHu0R3d76KOm8IDAu7Esq9264HXmn0dwgL6jQaVOEuqbZg2+ZpNTYlFUhT
	WfpfzDXvCc5Ft2alaySNTxFLPb+r1L5IQ0S2yd7IjGMefl1Hj9xIz9FVYkliXVsBCAXCwzNIqUf
	PKgdK+LxRifEkgbRWccqg=
X-Received: by 2002:a05:600c:8b68:b0:485:3991:5d4 with SMTP id 5b1f17b1804b1-48539910730mr101528685e9.31.1773107358294;
        Mon, 09 Mar 2026 18:49:18 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439dae2ba66sm27285627f8f.20.2026.03.09.18.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 18:49:17 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org
Subject: Re: [PATCH 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/
Date: Tue, 10 Mar 2026 04:49:12 +0300
Message-ID: <20260310014912.3023668-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
References: <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ABA91243CBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11752-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Nicolas Schier <nsc@kernel.org>:
> +# Keep around until cleanup in scripts/remove-stale-files

Linus said here https://lore.kernel.org/all/CAHk-=wiHK5_oBUdUiNAaevmN9f-ORe+QBqbRefAZaw-RbgEn3w@mail.gmail.com/
that he doesn't like scripts/remove-stale-files (this is my interpretation).

-- 
Askar Safin

