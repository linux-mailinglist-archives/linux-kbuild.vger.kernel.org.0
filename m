Return-Path: <linux-kbuild+bounces-14008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3m16Mlw7Vmqp1wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14008-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 15:36:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8025755390
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 15:36:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=F1Su1TbF;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14008-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14008-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AE3030102E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 13:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F1346AF03;
	Tue, 14 Jul 2026 13:36:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC73382F4
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 13:36:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036166; cv=none; b=ouSWrJ5SvWfZbFUUh8FuwH0eeBr39sYCuzSao0Q85u98hVxwMlKlafWKVkkki0v98GIH7kmlFTf0VYNf3ihNkRG5zLXHRIOTJS+WsVDF+WzfvYootS+ijk9H9ylfQjZC68rQGw7I6eQdCxfY+A49+AmKrkWAntAWcPWQfIis+fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036166; c=relaxed/simple;
	bh=LntuTkEkcpgOciuQLLeQw3UnDTxWIKJmuj8XrBupXRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s6RbX8BtWBuoTNcqhAwTpOkILx7v+aqeF6o+KNvuiv/NCdmXXKg/VBodRAWWKsyPs46GU4zuafQBUpLuoG0mVVOM30aLsgIOY229Q//iA4z0N7RgLeJku3xgO3koisDs/8LetLI6+VUPZnJNbA3YO9Zofp8XRSxmGV8JlvVEh5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F1Su1TbF; arc=none smtp.client-ip=209.85.161.47
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a375ba035eso541941eaf.3
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784036163; x=1784640963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WtnsB/5RqMWNV05DRP1OqiXZh9YAB0wkSwZwc1lWL1o=;
        b=F1Su1TbF7X46qcSplLRyh9eXrd8MKWrMU1QtH+U3ClhKRT5oLLt1WkGISS/EmUnaRc
         ZqHOrl8uf2XbkBSeCGjvZE91To/dXNRQm8fHB9eCO6sJBOskm8QsmI4pWVBqbseXnx2z
         sW76q0KvYj/YyzQjGVcW3arJ0v8sVXBY8k78g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036163; x=1784640963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtnsB/5RqMWNV05DRP1OqiXZh9YAB0wkSwZwc1lWL1o=;
        b=ImPcUGm9j/h+Jh+HoeoQbt7jevtTXrZ8orNCiIlyC60c1z0Z6j8GtuP1xqEor0mcd2
         YsEw7t+tx1krO8pX9ELnSw/SJlxXyKF+8vuoZSzE8qUMEnMzMBPsC6zCSfVLWZbgWBZq
         m391Y80+mAvRNZULpqCKGAYg5PlAZFv9f0gqzVFYtxLyGiQwqnuOO0oGFZSCvIup3CIi
         bSZbOHpsfk1C43pfWxzY2737bJfnmx4NvPO92nGCWDY7UIN9zK+Z7JoVqNIrk6s20YGG
         Vk9VwqlWYk5xz85joS1fJxUNIqDwBv9advhuXgiXGHwj7J/UZ2CGHTZD0bfOp/eUiL5e
         IOjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tqKRbaulE5NYa1+5eUcZxXlWXOLFDoqqWfiZYYLzQUcbXG1qodu+Z4pjhJDQhU6OjQlpm2siA2ERdvjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTK4MZFiZzbjxBuf/7EljgZjQt0zYQ2rUi7RoRyGZUjgzmp4A8
	shzAmBtOi2J9T1x9vvbKYSm2t9+n0ZOCKRTudatTF87oavUtmAKo035aYnxQoaOzoQ==
X-Gm-Gg: AfdE7cnYZTtpbljKW0AKvweaFnOoABTxrKO6uUyw7y40ilkke3QDgVmDDQNKvnlrupY
	lboVGApPBIp5qO1rMVjQ8a7zwO7rkWP7Zj/0rw+wFi4KpLka5okuhTPYzRXP5QzP2M+gysnbtj5
	FRY0OItsIdfeTOLQQXR9QdBeN+JpEb+CXAkFdG30uY+Kbjuq9gmTQVIui1SYzLYAfePlVwzmneY
	x2uRpNyDBanZRFbM/mKTbJ8jZGGJ+ZXIlJAKORiKE3D0LCVPWScQHSnLztWwrypUAo66WIyr5tb
	zsYyHyuIe/FKz4ZKFpNuFOpduCj40GCaCctX/UWqgr2Ot9UUGlqB2t1llrfDVmgga3VIWlCM5Z8
	UYOyc5a4A191hovSG34ZBQ96MhE8E3vVX9mhFHodKa6ekft7jZ7y2fDZA4SdHDTXwmsOTZiiEvY
	f8J3eBfpE=
X-Received: by 2002:a05:6820:1694:b0:69d:f0c2:73f6 with SMTP id 006d021491bc7-6a39a5921fcmr8099401eaf.16.1784036162714;
        Tue, 14 Jul 2026 06:36:02 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a377bd9cb1sm11688216eaf.15.2026.07.14.06.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:36:02 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Simon Glass <sjg@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Xingjing Deng <micro6947@gmail.com>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kconfig: abort rather than loop for ever on EOF
Date: Tue, 14 Jul 2026 07:35:42 -0600
Message-ID: <20260714133545.3294648-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14008-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[chromium.org,kernel.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sjg@chromium.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:sjg@chromium.org,m:nathan@kernel.org,m:nsc@kernel.org,m:micro6947@gmail.com,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,chromium.org:from_mime,chromium.org:mid,chromium.org:email,chromium.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8025755390

When a non-interactive 'make oldconfig' or 'syncconfig' meets a new int
or hex symbol whose default cannot be applied, conf_string() reads a
value from stdin. At end of file fgets() returns NULL, no value is set
and the loop asks again. The result is an endless loop which fills the
output until it exhausts memory, rather than a clean failure.

Detect this in conf_string(): if the value cannot be set and stdin is at
end of file, stop with an error that names the symbol.

Note that a symbol with no default doesn't trigger this, since
sym_calc_value() falls back to 0, which is accepted at end of file. The
loop is triggered by a broken Kconfig file, with a default whose text
fails sym_string_valid().

Such mistakes do creep in from time to time and are hard to debug, since
the build fills the log with repeated prompts instead of pointing at the
offending symbol. Some bad defaults draw a parse-time warning, but
menu_validate_number() accepts a reference to any int or hex symbol, so
a cross-type reference loops with no warning at all. For example, "0xff"
is not a valid int value:

  config HEXSYM
          hex
          default 0xff

  config VAL
          int "Value"
          default HEXSYM

Interactive use is unaffected, since feof() only becomes true once a
read actually hits end of file: an invalid answer at a terminal still
re-prompts, while Ctrl-D at such a prompt exits with the error instead
of looping. bool and tristate symbols and choices already accept the
default on an empty line, so they still take their defaults in a
non-interactive build.

Tested with int and hex symbols carrying such defaults: with empty
stdin, the code without this change produces around 190MB of repeated
prompts within two seconds, while with the change it exits 1 naming the
symbol. Piped and interactive (pty) sessions still re-prompt on an
invalid answer and then accept a valid one. A new string symbol with no
default still takes the empty string at end of file, since any text is
valid for a string.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 scripts/kconfig/conf.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index c368bec5ab60..fe8ba09b0039 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -348,6 +348,23 @@ static int conf_string(struct menu *menu)
 		}
 		if (def && sym_set_string_value(sym, def))
 			return 0;
+
+		/*
+		 * A new int or hex symbol whose default fails validation
+		 * cannot be set from an empty answer. When standard input is
+		 * exhausted, as it is for a non-interactive oldconfig or
+		 * syncconfig, re-asking would loop forever and grow the output
+		 * until it exhausts memory. Stop with an error that names the
+		 * symbol instead. String symbols accept any text, and bool and
+		 * tristate symbols (conf_sym()) and choices (conf_choice())
+		 * accept the default on an empty line, so they are unaffected.
+		 */
+		if (feof(stdin)) {
+			fprintf(stderr,
+				"\nerror: no value for new symbol '%s' at end of input\n",
+				sym->name);
+			exit(1);
+		}
 	}
 }
 
---
base-commit: 59dee6d28756c629f3a0bb56266f80e36ef7c99c
branch: kconfig-eof

-- 
2.43.0


