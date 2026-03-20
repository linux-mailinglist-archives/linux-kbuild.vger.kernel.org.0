Return-Path: <linux-kbuild+bounces-12098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJQ6AMCTvWnY+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12098-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:36:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90F2DF849
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B60C13176CD1
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 18:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E9C3E8C50;
	Fri, 20 Mar 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HLDZLO08"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA1C3E8696
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031372; cv=none; b=eCtPo+5LObrZLDlHqPeNhCg9QlSR69afoX47zHQo37sJYc3NluNcz87qBXwvnuz41Z7BqHCpbeKj5ZjkfIFbfV0vMa+gxqNo0EvO/gojT8Pj19vi/f0dQGXlM94kBG4kHM4pdzEVg8XzszJ2SnROEPONl3sFSGJMGnLFAI2rFGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031372; c=relaxed/simple;
	bh=O7o7FBrPlToXKzC8pwAquL6Os+AvG4huHyd9CtSYQdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSaX+9wo9XYzTeBcGviugVQ2EYq79t3tgCizuF9JPi/SVe171la0BOPtv8nENvN2SWNA8PGzd+RHGIc/Ci+CMqSVbGykpAirD6jyIrjl7aL8AxxLOMTuKDpPMJ/zSYA6N4ZcNm8124xAguaQkC9sI1gJnjTOlK0WQabiBGzolec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HLDZLO08; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso10654345e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031369; x=1774636169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVnHCyxPSc13ZQGZZoG5qnRzMcihNg1l/YgU2d0QRXU=;
        b=HLDZLO08EijGIj3i1NCrBWixoJ1Gqj95z7/ezrdjqeovFJldXbZIHuAj4psQrUjCRx
         YolOaxSz1GZYwk9/F+Zyw29GPNbcZiTkvMfHcBJJHvpGx5odhpM6+qkNhOfhNEdbg9RH
         nZHsHH2yIyfo05Ad5h4PAmMGwiX1ica7AkabGPyuwb+nvsv+67wUpNZZ1ngSOWtUEvUY
         JYm+XllKYZzZVYCNPXIJw19HCJosUl84zz82tt13OW/vqydzaR8+ZzNSRV+gl14MKbw3
         zjZg5RuzOrl42LtTd3LMFFsNvMjDX2xQiHXbiPC7hXV4KtVtisAdNYDp2gksd+9yX6gO
         aQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031369; x=1774636169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EVnHCyxPSc13ZQGZZoG5qnRzMcihNg1l/YgU2d0QRXU=;
        b=LE5cg7YtcLdPBCpN4zmow2zwXJzsuXJ1maUj9bnE+ArsqqM0miVwHRorW7s78l6y6M
         xljmijCw32y7Ol8fjGhFSIjIC+Tgt9NAXkLMrkxGy5xhrPg+Kf0LOvcjpkhnlqylGu71
         KGnSl3tEoLYP2mhlYAYvmHv0+3vFE52m/seLzr5qwWY6ZYOl4fn6GTypTn8RiKWoh4ZU
         hR+eONQvHsTQ1TjINzVUp4qaF/WKHJLXKAZs78835S0aG0pLoIGLiyzDv4gGOf4aGYoJ
         kT7JkgFVLm+Q7JQVsWnq+EXdAhX9Z18eVUBQTQj1YsCJmBOUmpokILJQ8f9ynhh3Zm7B
         GRNA==
X-Forwarded-Encrypted: i=1; AJvYcCXRacGHHzF9gyhqq8fsp/qrMCNMFa8PmVKM9SOv3shsHspPKFzpMF5e76NRUI1zuPFXtfr/zNDFMa93LbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTF73YjRtS6VMRFR59IMkQgE6EO8WWB9v17A1CU7EWckL9XoyN
	NUpBoiFAqobSgoK+AaBm1o0EoK3/hBttSoaMrO2ig7KeUMAgcOWqurzUzVlpYWpVJ1s=
X-Gm-Gg: ATEYQzwH2xxLJFDtuEwTwxnt3YF45JIPDADVUBLTTluuvGxXpBIJeY3lkQ639ff2Q+h
	7fnh9bwJj5T6CRZ6MXM5nlgyEWtdD/4zyrKLn4YMU951a7XtUpdeZIouZ8MasUXwDHKEbcB1JSb
	fg0hFtxOU4Wut6K1lFE42LfrrNFi39rHD+Z00BBnltybP+xhWFk37IoV/uoVBXJm/ZGHoGjgY13
	bX2EcO41FgRZo8ayLcQ+5SGDMGI6YcV2u5P3LewwO65bQTz2JnpXfRNWpABhd150tTda38+v5vE
	SdiZU+r9vqFx9YXCagaJqiNAHi4gByIl94dNp871LSLrIBdP5HFU9Go66EHKoMD43Bb26p0uijP
	yU9IlQg2NCIDPzlThPxy92D3TvWSpbN3ZCLhh96LREOsjV1+zlICywc7ouWkkROUjUWYws8Txqs
	6Pp6VcS+0J9A==
X-Received: by 2002:a05:600c:17d8:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-486ff0291d7mr36513385e9.19.1774031369285;
        Fri, 20 Mar 2026 11:29:29 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903e0b8csm19938127b3.12.2026.03.20.11.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:28 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:16 -0300
Subject: [PATCH 1/6] selftests/run_kselftest.sh: Remove unused $ROOT
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-1-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=594;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=O7o7FBrPlToXKzC8pwAquL6Os+AvG4huHyd9CtSYQdo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGTUlS6YOvkJjppJyfBvXK+uRYUVLQot9lB+mJUvYRjukWYP1Bcj5+pxL/nZwWFDAkKeJr2lRpf
 /0YazDWx3yAw=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-12098-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F90F2DF849
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the following shellcheck warning:

ROOT appears unused. Verify use (or export if used externally). [SC2034]

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/run_kselftest.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 84d45254675c..9abea79018d7 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -21,7 +21,6 @@ else
 fi
 
 . ./kselftest/runner.sh
-ROOT=$PWD
 
 usage()
 {

-- 
2.53.0


