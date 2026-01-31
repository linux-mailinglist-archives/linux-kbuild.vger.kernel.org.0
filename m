Return-Path: <linux-kbuild+bounces-10954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHduEBSxfWnwTAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10954-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 08:36:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D85C11A2
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 08:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0D6B300F9F8
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 07:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B81333442;
	Sat, 31 Jan 2026 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxUD/sd8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8900B329E4F
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Jan 2026 07:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844999; cv=none; b=fCrmeh4QRhLNaZ3EEnL3P+bNJnptyRzkWsuoYxNtSXFilbk6udjf5jyEdFvEP+MFed63XHvAm4D2xW3lR0eurCS9GaDWAMLq/Tqm3D82b+E51mlupcc/WkJuPJnIwGEtL5Lz5QLSzZ8pFv/LsmYDlm/rlheYovDzHwNc4WgSIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844999; c=relaxed/simple;
	bh=nY7lzQOVExn4AJ6nTUtW8NcMqjv6w/dyQWietm+R40w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5kj68If0S7myroPmhqUI8/y0tMjU9GgwPYgzFIhUylJIYV9Nvkm1NiQFEgYapVpD3152HOrMCc8/FJ4asMO+npjgH6XwJvYskc6qda5W9C+fPfmydkCW3fspRAOmM3/AZUKAvMQ4iUzpKHt/1mWx2tH1uVXPxxUW/qZpwZkPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxUD/sd8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-480706554beso29983845e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jan 2026 23:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769844996; x=1770449796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n1UjayTk0hO0b45clVXSkBxo9hRuWG9N3/vJ5awb1g=;
        b=fxUD/sd8b3wQtQ+1lw6r6s407RaqfpNZfgGyYQigk6ugXox9dM52OaDnYiwwSqTzEl
         jEGEvibHs+f7Nqnaq7YuFS/JiIXWagxLk3hEhwz0ojyd/vHsiFtDQtX2FIKM4/RVsAzz
         F9HuybNgpagi9qIePKl/lGazzR8F4CR0P39bGKtsdeiqz1Z8AFU/nO9vMJgWj6OH/Cj9
         OyXk8Ln5zM7eieL5kmwj4GykrH3XxYSC/fe1Sh3xnK5tSExP682QdF4rTbYwfBxi6EqC
         7Wy1jeugDsSMWF22gL3pZV85LiwP9vGES3tElukotgVzSbOCKcBDDnCy2Glk5svSwHEE
         SZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769844996; x=1770449796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5n1UjayTk0hO0b45clVXSkBxo9hRuWG9N3/vJ5awb1g=;
        b=MOx/hcNUc27BZN5WrUB/+35KSHC5oZVpvtCWouhtlpjXyl9hH6fmC53vLGI9UGS+TO
         HwH/WUbow7VAooM3gtv0+r+G4Xafa8Kki4Nt8bBsqVwgJsNOW6/y4W7jjoEIyQ/DSjCC
         87LmjjxUMesTTw8H2KZz5W/WDbIYDAojo6XCOnt4SpxyOQ5zgGuiFIzNAaSzj4zSMyse
         Q3HVlXoXhmQz04KvdICRzwq9nUEIQt1SgVyWmiXc3tNzI3UfhgjC+kcJuj1YxX5RLdnO
         zGsjnMEKfYUcEwB2XuSUESkZllZtXX+TyEqWOB0DwdpCdZT3vvl/XEW6+/vjey+Ejj94
         MgMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSoxXykswCzA7bBaI/bwJcGoY7bN7WvNAm1L49Xn50TwffcWQ+aGaVK1SVF2k4ktC/nR3i0vs0pKcAKnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYldU4KHQoc3wTVilR1l0fvEw3vk0MrwQFWD3rRbxHqcKy7qJO
	WYVfetmeSZHU+nEryIOrP9xX9H8slHC6+PSLQ4Qpxlq3YGnFoS+pANSS
X-Gm-Gg: AZuq6aLbo5h/OupTa/wlZRXDutg65ZGJWghQmjp4YVMBsZZ3jBXv8pSYfDAs6tjiM/4
	c1fMooIS6HADieethcQno15etib90fyRbXZ8FHu+byxt4fIt6D2U94Drqz3Ilms6aj3/KX3manK
	vD0wJ8FAbG8WUies6NO3PY5p+wUDCq5NvOuv1K08df7CpNOBuLNslWbET4jP/1ekFOOgFvYOxtc
	LdghWYdyB7Q7wMuX37ZusneWOp/auVuBBtq3CmSOh7n2DsG/+fXda/bqvgu8v+AZyDn0LvXxX2V
	8/d8KUz3W1t658K1zC2C8KrLn1Sos3mYefcZZOqqKEfqDmbGV5usahlwiygnFl9/rGYcpqj+Kgm
	OadxoDjqSCqI5dogKz4ckMR95+xv3mnMSJ7W5DsBE0Gh5OOF94LrYIqOHvQfB8+BhrQVAcI5RPt
	u9
X-Received: by 2002:a05:600c:1e89:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-482db4ac0f4mr57301605e9.34.1769844995600;
        Fri, 30 Jan 2026 23:36:35 -0800 (PST)
Received: from legion.lan ([2a02:a58:9200:ea00::700])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cd8fadfsm248952145e9.0.2026.01.30.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:36:35 -0800 (PST)
From: =?UTF-8?q?Mihai-Drosi=20C=C3=A2ju?= <mcaju95@gmail.com>
To: linux@weissschuh.net
Cc: arnd@arndb.de,
	arnout@bzzt.net,
	atomlin@atomlin.com,
	bigeasy@linutronix.de,
	chleroy@kernel.org,
	christian@heusel.eu,
	corbet@lwn.net,
	coxu@redhat.com,
	da.gomez@kernel.org,
	da.gomez@samsung.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	f.gruenbichler@proxmox.com,
	jmorris@namei.org,
	kpcyrd@archlinux.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lkp@intel.com,
	maddy@linux.ibm.com,
	mattia@mapreri.org,
	mcaju95@gmail.com,
	mcgrof@kernel.org,
	mpe@ellerman.id.au,
	nathan@kernel.org,
	naveen@kernel.org,
	nicolas.bouchinet@oss.cyber.gouv.fr,
	nicolas.schier@linux.dev,
	npiggin@gmail.com,
	nsc@kernel.org,
	paul@paul-moore.com,
	petr.pavlu@suse.com,
	roberto.sassu@huawei.com,
	samitolvanen@google.com,
	serge@hallyn.com,
	xiujianfeng@huawei.com,
	zohar@linux.ibm.com
Subject: Re: [PATCH v4 00/17] module: Introduce hash-based integrity checking
Date: Sat, 31 Jan 2026 09:36:36 +0200
Message-ID: <20260131073636.65494-1-mcaju95@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_CC(0.00)[arndb.de,bzzt.net,atomlin.com,linutronix.de,kernel.org,heusel.eu,lwn.net,redhat.com,samsung.com,gmail.com,oracle.com,proxmox.com,namei.org,archlinux.org,vger.kernel.org,lists.ozlabs.org,intel.com,linux.ibm.com,mapreri.org,ellerman.id.au,oss.cyber.gouv.fr,linux.dev,paul-moore.com,suse.com,huawei.com,google.com,hallyn.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10954-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcaju95@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4D85C11A2
X-Rspamd-Action: no action

> The current signature-based module integrity checking has some drawbacks
in combination with reproducible builds. Either the module signing key
is generated at build time, which makes the build unreproducible, or a
static signing key is used, which precludes rebuilds by third parties
and makes the whole build and packaging process much more complicated.

I think there is a middle ground where the module signing key is generated
using a key derivation function that has as an input a deterministic value
on the build host, such as /etc/machine-id . The problem with this approach
is that only hosts knowing the value will be able to reproduce the build.

Maybe this is a solution to NixOS secret management? Introduce minimal
impurity as a cryptographic seed and derive the rest of the secrets using
something like Argon2(seed, key_uuid).

There might be another approach to code integrity rather than step-by-step
reproducibility. One may exploit the very cryptographic primitives that make
reproducibility hard to ensure that reproducibility is most  likely valid.

For example, the module signing issue, the build host publishes four artifacts:
* The source-code
* The compiled and signed binary
* The build environment
* Its public key

Now, we don't need to sign with the private key to know that building the source
code using the specific build environment and signing the result with the private
key will result in the claimed binary. We can just compile and verify with the
public key.

So a traditional workflow would be:
compiled_module + module_signature == module

In this case we build the module, sign it with whatever key, distribute the
builds and the private key to whoever wants to reproduce the build. Or we build
locally and the key stays with the end-user.

While the cryptographic approach would be:
verify(compiled_code, module.signature) is True

In this case we distribute the builds, source code and the public key. While
everyone can ensure that the compiled code is the result of the build
environment and source code. The signature is verified using cryptographic
means.

As long as no one cracks RSA or an algorithm of our choosing/has an absurd
amount of luck, the cryptographic approach would be just as good as the traditional
approach at ensuring that a program has stopped with a certain output.

