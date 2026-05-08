Return-Path: <linux-kbuild+bounces-13081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDxEOI64/Wm4hwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13081-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 12:18:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0584F4E55
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 12:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0267B30078A4
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 May 2026 10:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE3039DBC9;
	Fri,  8 May 2026 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUEAAqa3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F9381AED
	for <linux-kbuild@vger.kernel.org>; Fri,  8 May 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235531; cv=none; b=JcaUJd6LVY81OitfakXrDN/jMlyYWx9QsgOgTw5d4t4g1noOeQFCdmE1ZUa9+LlCHEK4D3wwX55gK4SgSwjUtDkJD3plB0wO5/Kxd/SUKhjtgTSeyUNzhC6Z/BmphZFnsgj9zHPU4fqupbrlGDd4wolGX4gTdl1hIZ9JETxeAyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235531; c=relaxed/simple;
	bh=r2KoCmoztaSvCNNFvMsvg10ZUzlTUEv67WMZk3NMvU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tbGvG2sPnT/UXyU+N6mLjM6S2ihwS5YttlJAkALcBXSXdc3G3+LVNb8exZ9W9VAGqLgFjDkcSb9EGGMBxZp7JN002VI/KPszg5+E5HrDUVK8+w3M69dfPosp5quiz2asXMbfnfGgbaTXi8adqdjxWIksj8YUMcYrnh3KC3FGcj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUEAAqa3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so167973a91.1
        for <linux-kbuild@vger.kernel.org>; Fri, 08 May 2026 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778235529; x=1778840329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r2KoCmoztaSvCNNFvMsvg10ZUzlTUEv67WMZk3NMvU4=;
        b=IUEAAqa3UXS0+eaOYeQoIJlvJBQAv0XiH4YNgzGKQ286hFwo5LfmCJbDhR2pOKgLi2
         iFam79A8GBxVMYFbz81saqshQpoYaiCv+nNKsn8p6b2zSlLuToWd56IoBwn/N3NFXcD+
         8YIlbw7cv760qpfJ8WYQ35dNiT4JkZ0C5yFqxTyw7W0Vhks58HDXGsKlOYvBlPoRoUqN
         KZZc2oyiaCw6GX90UKhGOsMtuG1jyheFH4fORuLZ+HRdGLnYrBxGnvgbx8/Cu0MiC7mU
         SxT4M01518r4sASJkUAracWZiz5nU3jqDtfK+wp8uFk1jAwS9izLOrYWGBoMyAUTeWI5
         ZVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778235529; x=1778840329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2KoCmoztaSvCNNFvMsvg10ZUzlTUEv67WMZk3NMvU4=;
        b=GIY+enyou5CjxMCZ2Vq5ZbmUtdES/ygdP+dMFFItOjWphE/laMjNGZTsXOcwbnIn6U
         HKhknYv/C6FGWObfKbQE1EoKl9ikP6uRGDhkwwvTqeSgacX9slsuGZWsxM4NLBzh7Bnc
         Lx+ODClKWUURaklnar1qPhM2BUYIIJrvscTG78/TBcKbQsFccp7WYlLIDTUjJZu7kBHC
         6g62xYiV/0XlE9wyUs/Hq5A/ku6BrqpJp+qIDGY1VYqVtzBUxkDGPEfdNTaCv7wmFY+7
         RrgkUQ5o2y4HwFxgIgfCubci10ZXgSxIymPYXxPpUlOobzpth73add3A3SSD6J92Dm08
         oOCw==
X-Forwarded-Encrypted: i=1; AFNElJ8Hhod3qTXRsoTejnDB3NIwRUR5cBqgj6Pei5ufcolVKdXB46dfNzl86UFUuzqiGpk+iFiUS4MkYVpdCK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYG8IoM50Qv6JIkyCPc7kBQ03AAjHQ21obxlZZp9yusl9A23vq
	8UJmkm+iKsCfd/LF1MinuL5TVUMUfircJ+kGZw2f1zZVyIzTydKCtaBJvoveWw==
X-Gm-Gg: Acq92OEdjKTruzWvwcdV6HTRoShnktXx05deXVvq8Dg4UzMFkcodKajVmHid5p/a77l
	fw9rvyfZtJnKWKkWqWiU9r1LqnnAxWZDosWmw9C6iHMsYX5Iu/2HkddKQ9FXeTe6jSr3AfGsuAl
	L32Z6r5gDhqjbfzTtp4TghLWteni5MB2KXwiAahZMTV4pWhXCiuJcrP8BykncTUVG2ja98gKocm
	7EvDbW4QcNSFt3zQY7kva443T5z9XtRT5QksrpfiegmiPqUPJNqtwdjhuxrdjtio0TupIIC5Aj6
	0bN3D/Tmr+F9iCt5JO+cHvAFXbNWXXRJPMg770fYctvUIDwgE1iwSF5KDO3h4DKcsnTr7OnLNMQ
	v1ZtVlPVf0MePEK5U/chW5Dp5WQLYUgAMpU8rBLpHh6dEFAIdSDzjTQCwCFhPPVQDPBOyJiGgW8
	f+6CwHDhmHAP8ERwAnuqJ8Wd0E+bvlgSkDPtxeJXFz2HJeVVsifUbsZdYAOTL9/aHLPVKoNvrz/
	TbB
X-Received: by 2002:a17:90a:d88d:b0:361:45df:102 with SMTP id 98e67ed59e1d1-365ac27037cmr12088432a91.17.1778235529310;
        Fri, 08 May 2026 03:18:49 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:214c:f197:a90b:ecd5:8020:ab05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3664da5d5fcsm1711404a91.5.2026.05.08.03.18.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 08 May 2026 03:18:48 -0700 (PDT)
From: Jill Ravaliya <jillravaliya@gmail.com>
To: nathan.chancellor@kernel.org
Cc: Jill Ravaliya <jillravaliya@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in builddeb
Date: Fri,  8 May 2026 15:48:35 +0530
Message-ID: <20260508101838.27567-1-jillravaliya@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8B0584F4E55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	FAKE_REPLY(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13081-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jillravaliya@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Nathan,

Just following up on the v3 patch I sent on May 1st.
Wanted to make sure it did not get lost.

Happy to make any further changes if needed.

Thanks,
Jill Ravaliya

