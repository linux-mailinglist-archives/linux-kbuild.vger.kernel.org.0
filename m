Return-Path: <linux-kbuild+bounces-13951-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jtNfORgvTmpNEwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13951-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 13:06:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B53724A5C
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 13:06:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B8ADG6E0;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13951-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13951-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E20693006B5B
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2026 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB30426D0A;
	Wed,  8 Jul 2026 11:05:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD21A9FA8
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Jul 2026 11:05:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508739; cv=none; b=WIzGPNjPJPbjD/6i1aCoITMA92uiuLmfhHtWcCQCvXU4ckKOHLK+uK6VicUC1DNgYIpJuG3X9z7xKA27xwyY1IZQ+jURKRgbR9ueJ+fgkYCjp/4psc9bNZ+/c/BHVOObS+Acd8qMZ9tSez6Fa+BlwsVWtBgvLDTe8/QfmbNw6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508739; c=relaxed/simple;
	bh=g7TKtwIoR7hF69PllbOkWMRVAs9fSIATXNwM0DBarnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jJ5yiwUvwMNFXGbUsYO7jXTtoV1JgIimT1CA3HBKhcjpTAmzz3sqkt+pHYGjjUiEQwUZCXlprQdU20bQd78favVPDrKPm6TC22GZxGgkybJXQw4BbnF4lfxJ3w/NZzLC+tgoMslObC2sWuZBgf6TdYdwxQJBzvJLZwHqYH4vj4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8ADG6E0; arc=none smtp.client-ip=209.85.160.51
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4498f3b4910so10941fac.3
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jul 2026 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783508733; x=1784113533; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lEkVqEsTaFS1+M9dWcDZqiBa/DzCWvMeBgnXYL+fMX4=;
        b=B8ADG6E0j+ixe+9kGvbRU00ICR+Dz/UZ55DtmRQepklN0pLKlQkZzMk5ArZMj935Zn
         19XG/X+OB0+UVNaSDi6sL0glTmlPwdtuPtFM8AVk4YL/CAgqCxiWEgNdassDV8vNOVyt
         Bu7KOscqUyHpvTDDp8ahVBUqgzz4FlE7mnVJookr3A308EaNmrnz7bEamaFoyxXNIKMw
         lvEtLWYGGkqxhdD7E3k9Uzd1waKdmRHDO/NjXnfNZbYEsKZuHxWonjcycdwlQXDru1TL
         GvQ4C2KenbdVArvgZ7qSlapeIbMBbrN7mHbxN86vSvKQ6bbFk8qNAoJF0+RcFlsCIojH
         IvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783508733; x=1784113533;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lEkVqEsTaFS1+M9dWcDZqiBa/DzCWvMeBgnXYL+fMX4=;
        b=b6EvhgJN2TCVDYQMKk/by3mOMGhOH/rZnI9GHCd5OVFpmJACMyyM2xKCkAEjzRGFah
         3OmVwUhCmvrGW11Uv5ARNnOuqkYeBK6pDfpVIXMKpAZmMIoB5vkrTkr71BuY8KgCP8a9
         Uh0L3xasUXspj+KkET0bYmlcrWqbFck7/kPF9HJnC6iV2Q61betXqkpMjYuXWlZuESTA
         hDaLrREVkCJnLBnNc+7DpBUpT+VECDjN6t2G/LVLEy1GRin0svj2lj/IDCpnaxKXfQig
         fd8QVGtpelFdErIr/yw01blrvoHCmJ/R4WgkAcBwi3YJgNsMMWVmYwXsIYf9wwo1ZG5u
         5SZA==
X-Gm-Message-State: AOJu0Yzq2IqCkHUhQ9dFqdFN8gTiGW9ui0mF2maoNgfCwUghln1UagQI
	TFdGfxaf8E5hMmbZDOT1rXTMtEh9+DBIkuOPFvZAT0hAVNFo1JnwBfKq
X-Gm-Gg: AfdE7cmLaEpXZbUg1YcmzwqArAn7/97n8zY1SmhfWNblXRHZJ+H6hRdKFJHR+OWZhbJ
	9/tFn1ngctIac7LRGGj4ZlG5wBDTIKPug2GEChZ8KfTynb2j0ovp0tl7vTuTnr4L0RHugHwxaJq
	EgoP/7qFN2DSI+VN0hz5LIchO09kJ5fIHGpQRxxrqa0atw9P/wFUQ7BRmYH1nAf1R1eYwFNmWJz
	DtDYbVzPciN8chkV+icRyWY7uGCrLt7CN56sX6zwwmrey06Y6Rj5kDQRrGmojQ9WvL0hVZaemx+
	daYuexqXWHY0atC6J6y5K+T/9cUqhM3cUSRV/jWjy7GEu8vZ1zN8HQgw/Evjfimc3cJau8/i+dS
	JmLfKRNmYWz/5xBNv9fKXYIisrYjeb5EThtXVLCIvWjjXZ68+GuXn2IIKUsMrwamPlqPhysw7jH
	pypURW
X-Received: by 2002:a05:6870:e190:b0:43b:5127:7511 with SMTP id 586e51a60fabf-45163c03223mr892819fac.4.1783508732744;
        Wed, 08 Jul 2026 04:05:32 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:3::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb5db92dsm15995998fac.13.2026.07.08.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:05:32 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 08 Jul 2026 04:04:54 -0700
Subject: [PATCH] scripts: kconfig: merge_config.sh: keep temp file in the
 output dir
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIANYuTmoC/x3MSwqAIBRA0a3EGyeoQb+tRIjYy94gDT8RSHtPG
 p7BvQUiBsIIc1Mg4E2RvKsQbQPm0M4io60aJJc9H/jITgwWlfFuJ6t8TldObJu4Eb3Qk+wM1PI
 KuNPzX5f1fT+/boV2ZQAAAA==
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Breno Leitao <leitao@debian.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gustavo Luiz Duarte <gustavold@gmail.com>
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13951-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:leitao@debian.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gustavold@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gustavold@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gustavold@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82B53724A5C

merge_config.sh currently creates a temporary file in the current
directory. Create it under $OUTPUT instead, which allows running the
script against a read-only source tree.

The default behavior is unchanged: $OUTPUT is "." so the file stays in
the cwd.

Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index f08e0863b7128..a63250d4cbf12 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -122,7 +122,7 @@ fi
 
 MERGE_LIST=$*
 
-TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+TMP_FILE=$(mktemp "$OUTPUT/.tmp.config.XXXXXXXXXX")
 
 echo "Using $INITFILE as base"
 

---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260708-merge_config_output-d90c161a923c

Best regards,
-- 
Gustavo Luiz Duarte <gustavold@gmail.com>


