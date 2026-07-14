Return-Path: <linux-kbuild+bounces-14002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A7EnMYj1VWq7wwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14002-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 10:38:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6347527BE
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 10:38:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZRNHBawA;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14002-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14002-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64EA7307059B
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 08:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E73A3F86E0;
	Tue, 14 Jul 2026 08:33:54 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF3440B6E9
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 08:33:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018029; cv=none; b=llZo7wZQuaPiUZZo82y+B4Wc13M4/e2U4kCe4vdrTorJr9WbgiwQok1BWylO7w9MWpdNwkwVK3+E0hblDiWxUPQKvrjx92Wu775C0mxCg7hHqanlwh3lCkwoV3fqlZer7gyI/pamkkSV5GJ/e6qAi7Xi7csorGMo2c9QS2jqXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018029; c=relaxed/simple;
	bh=IHW0jrVYKirRz4xFnRAvekmWCpqi2k7RyAf7Y5W4PyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekkhyP5jLJzT8XeMRZ3AP9/xTwEgBEqCicmyJPVkSbBqlug0h8SDKLuQLX0wRnxRMa1omtETgR1IXdBzhNpfijEpwyV3kEBCxBQ09MjDZW6Y0xc3CMyEjgRDHDBBVHp3LXaOZkNz8b/L506hNh7A/jL6RIkEl7g5Ap8GHDPklfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRNHBawA; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so5156045e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784018020; x=1784622820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dN43QeMKt3opRlURLs9WAJqq1Kw1gcGP8C53HZV1wz0=;
        b=ZRNHBawAzRsgDKjWIYbkX/L1AqJpGi259NXywqFklR5avA8/pAhNQPKxfaa7liKDGY
         NV9ytgt92T/KO1vMDsKuWiBcWT9AtNz/q4ge3CeGVXADTLhavvQiF9NVejobzMQizcy+
         OSYECwuCUW4yzY99N0TT7xKej9FCV+CvkR+uyeaFsaQupoT92k3dVzY9RvibPF+ZrP+k
         PnAoa2EWiPB8TPl/VQMTjpbig2UNMZ7cS8uNkIMfR+3jOe8IBchyDeaoSngsoWYBhj9N
         GKF0e4AZ0teyjC1rpeqSD2d/+7s9DVcmuPxCqSuEKn4MaUjLkoWCwiF302XoWJHMFDu+
         PJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018020; x=1784622820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dN43QeMKt3opRlURLs9WAJqq1Kw1gcGP8C53HZV1wz0=;
        b=S7Z4MFnPyKVtyGjA3Sx0Dw5iWvyo/DiLhC01HIXN1kmHcAIwvbFwqRoCDvu/nlH7Jw
         GLopVcgbrK27dA8qlPUNciOb+X9GiUQx/pcxrlQ6SRWGNBDWhAOL4vIy3oUbglU506VN
         270mA+598i0FYRiEG9xg5ssFh4OVjfHU0Ce7/zxRIc2IGiSOyjeyrMUPR1pjMGa1Cl07
         O+ysPljIy/juaP1/WtPbI7XrdHkAyeQQd/o7yqGtcDhaJ4ju6BMz/MwyOR0ZlPsCh6Ch
         D4f+qh4tSK988AD4JmgRPcTypiCZxzZgUKVTaeJjFTWHm9uhuSiVazq5OYrTVOjsLPlq
         948g==
X-Forwarded-Encrypted: i=1; AHgh+RpsBZugk72i4MNeorphSmwXmwxz5gBnaREH5beTNY+v8a7XebIn5yQAyvFDh8ToPzGwmdz2pkZv6a/dt54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WXrsw7YtKnMiAewsTU8wVy4ksXpjdb0BOEdOylZZlZ7yg6Cm
	RFYBaxZzI+1BCoTGFLiK8DbDiZlI6EA3m8IAPpMxxMMpBRaGIjrCSy/i
X-Gm-Gg: AfdE7clRU04bJLEPHcDfA76WITsFAL48gon3YVTxMJWzQDz03YypUzuWSRR5xWeMDOH
	GTgax+2KadcwBqCf6xTgvV8uB/yx+exCzeEVGZL/mlfhjpZm5VHTJ/1e6eIuYSYnpAYNYZoZazp
	sJ0JIz/m6mmduB9KEHhSKS7t3tlZw0LLYtV79lRkK6QwJnGG2q1uQn8AGSVeSlPUrDVUlFC99HF
	x4jkzi3U+BNlWJBUSOOenYaR5HKLkI53APsUvN3udYIiMbz0H845KshmZ3do3waqPUDeQHSF4td
	Ca8oezmZSRN8iCL5YYn8SUjjz23UyABtrHaHc+yy3EjGzas6E0MXyp32v+FAamVvx/6Flq6HAfh
	aA8lRWoaDK+89geqlvqv4GA3me7QX9NMudbCBMEjoh0VAqV599cRGWZXFxGdrZWx2YfLP23oOCw
	WQnPlaevQKYA+hgQFBHWfHTcxKjATv42YlHg==
X-Received: by 2002:a05:600c:1392:b0:493:f753:24e8 with SMTP id 5b1f17b1804b1-493fed59338mr109265975e9.6.1784018019335;
        Tue, 14 Jul 2026 01:33:39 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a33a926sm52933245e9.15.2026.07.14.01.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:33:38 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: ojeda@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Sergei Litvin <litvindev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] scripts/tags.sh: Prevent binary files appearing in cscope.files
Date: Tue, 14 Jul 2026 10:33:31 +0200
Message-ID: <20260714083331.69482-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
References: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14002-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:litvindev@gmail.com,m:stable@vger.kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D6347527BE

When executing the command `make COMPILED_SOURCE=1 cscope`, the resulting
`cscope.files` file contains filenames with the extensions *.rlib, *.rmeta,
and *.so.

To fix this, modify the regular expression in the `all_compiled_sources()`
function so that only files with the extensions *.h, *.c, *.S, and *.rs are
accepted.

The issue has been introduced by commit 4f491bb6ea2a ("scripts/tags.sh: collect
compiled source precisely") which implemented the parsing of compiled sources
from *.cmd files instead of using the "find" command.

Cc: ojeda@kernel.org
Cc: nsc@kernel.org
Cc: nathan@kernel.org
Cc: stable@vger.kernel.org
Fixes: 4f491bb6ea2a ("scripts/tags.sh: collect compiled source precisely")
Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

This is the first part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Changes since V1:
https://lore.kernel.org/lkml/20260705175936.4653-1-litvindev@gmail.com/

as suggested by Miguel Ojeda here:
https://lore.kernel.org/lkml/CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com/

- Add "Cc: stable@vger.kernel.org" tag
- Add "Fixes:" tag
- Add missed "Signed-off-by:" tag
---
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..c9dc2763a505 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -100,7 +100,7 @@ all_compiled_sources()
 	{
 		echo include/generated/autoconf.h
 		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+|(?<== )\S+[^\\](?=$)' {} \+ |
+			grep -Poh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
-- 
2.55.0


