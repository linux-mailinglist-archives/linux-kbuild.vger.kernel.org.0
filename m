Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C3B3D7FDC
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 22:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbhG0U7V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 16:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbhG0U7J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 16:59:09 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05B5C061760
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id k4-20020a17090a5144b02901731c776526so6579739pjm.4
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hAtUXOqdIbIKgIXF67i6edRxNnI31C05ADltnD47YVA=;
        b=KjyaAeWacqkMvH9zZm+BBzMkjACC5HUxdXv9tgcqmihQriCrMtd/DFnnW7F/YrD/ZY
         Ukevt5iMkwkus4GIj0BPscD7xfNb9o1NPLdX8zvYUy6Vws2evRXwUJ9SqM3iq4seKTMQ
         0scT3SXeeEgeJXutbDZfzTUKfHAc3euSilyDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hAtUXOqdIbIKgIXF67i6edRxNnI31C05ADltnD47YVA=;
        b=MHGND7OWbFdye8iTlPApACDIs5kVQMN6QamkcUx7WEmECE63ezZTyOW8mDpl/AlSAV
         dGxsl5O9Si5QHiY5eob/TlQXpwENvQ0uOfUDvO5rODjjBQFygNED4pwlrLMxUlWZoL8I
         J9KfdTms45uJCSF5tlGuzvxSovcz7qNXI0s7cRs7tx/IB8TNuqVUaC2AktGJTbeMIrZx
         micmuxSbCfLRkrlfxLrIZF/NqzKzpWs4EJs8q9pIOio1BKIRYwxQ4OiElSI0lsCofwpB
         8YReEqlhLFllWM0rZsO4oOcrEZ9veYn1913XT3/o39+HDyZTChhMXepzdWNNNGxHjorA
         /19w==
X-Gm-Message-State: AOAM533b+rPh8U64sMscSr+cp924ao4S9Qz7AzVWyH80AX4OpPx4Lfgo
        EfO39ZBPUwWEhLxs3WHE2KsiPQ==
X-Google-Smtp-Source: ABdhPJwKVVacR07W565BalKjkQLpWp2QT/TsDZexTOWZktzaVimKCn1vRk5Czb/MD//fHQXIbyCEWw==
X-Received: by 2002:a17:90b:3581:: with SMTP id mm1mr5913025pjb.98.1627419548265;
        Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a23sm4591110pff.43.2021.07.27.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:59:05 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-hardening@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Keith Packard <keithpac@amazon.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH 10/64] lib80211: Use struct_group() for memcpy() region
Date:   Tue, 27 Jul 2021 13:58:01 -0700
Message-Id: <20210727205855.411487-11-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3842; h=from:subject; bh=LxMwWIiVXxCqRjC5BkCQhCAsNp5uK9myZ2a4Qy1ipzQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOCS1cmBCRtXI7M3opQcsNvUfw7QHdDVtTF33mg z+crDrWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzggAKCRCJcvTf3G3AJn8DD/ 0T8GLHAQTW4lQjhfBYcVN4KkQX84OyCKR/kM+6CyPh6kkSz3omcb5syI1kQjZZfi9AQMmXGm27pqXs Pfzoata/9c4TApOgEv263SYMjRV3AKeFaFCN+M+Tbki7UCpUotJm9dnRg/YZOUqcEJ2jnQpyukE/h5 WjTdoxGr75vnhyjqxtCW3aafwRG0iXBck5QQofWTgn8C998AMoFRs6Tj6WLGt00Byih284TbE5zULP NoahBowuHSS4qSopyrtMF5eCvftM06BTwO2pAHfSDoGwCRneDXaPTK82hxwFjKQowdrTh4iICk8J6z Jh8Cy9g9/qrCwlclWJxjLE11hOD2f4KFeZpANKSuUdLgh2gQH0XSCj9eew20UORocfAqHkT/RzbRTF SJY0WkjJuqFW0W0eO4eaZyUsWJHuNBEL3OEenTA/cKGL5oil0bnf+evfjR6n7xJYUez++9bbUL8NyK mwpGoz6NjtaMd6T6SdpdeK3SjBHnQVR7cnuN787a4kSO0UGQ/qiXd510dvC35+ROc9KccdBJQ9O8UG j59WtvEuYIf3wGvX7Gxat7V2DjodwzEvDiy+CyhMLXhp2kdRYaftK+hlMfdh3hvdX9HK1wsHqnZZNW 2jIB6Lm8e5R4+zKVC9MC8ZxvWDlXi8uYXm03gL2lKA5E1/cQXWrwqyFnfZrw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() around members addr1, addr2, and addr3 in struct
ieee80211_hdr so they can be referenced together. This will allow memcpy()
and sizeof() to more easily reason about sizes, improve readability,
and avoid future warnings about writing beyond the end of addr1.

"pahole" shows no size nor member offset changes to struct ieee80211_hdr.
"objdump -d" shows no meaningful object code changes (i.e. only source
line number induced differences and optimizations).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 5 +++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 5 +++--
 include/linux/ieee80211.h                     | 8 +++++---
 net/wireless/lib80211_crypt_ccmp.c            | 3 ++-
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..be7cf42855a1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1421,8 +1421,9 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		ClearRetry(BIP_AAD);
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
-		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		/* conscruct AAD, copy address 1 through address 3 */
+		BUILD_BUG_ON(sizeof(pwlanhdr->addrs) != 3 * ETH_ALEN);
+		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, 3 * ETH_ALEN);
 
 		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
 			, BIP_AAD, ori_len, mic))
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 79e4d7df1ef5..cb47db784130 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1198,8 +1198,9 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		ClearRetry(BIP_AAD);
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
-		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		/* conscruct AAD, copy address 1 through address 3 */
+		BUILD_BUG_ON(sizeof(pwlanhdr->addrs) != 3 * ETH_ALEN);
+		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, 3 * ETH_ALEN);
 		/* copy management fram body */
 		memcpy(BIP_AAD+BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index a6730072d13a..d7932b520aaf 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -297,9 +297,11 @@ static inline u16 ieee80211_sn_sub(u16 sn1, u16 sn2)
 struct ieee80211_hdr {
 	__le16 frame_control;
 	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 addr2[ETH_ALEN];
-	u8 addr3[ETH_ALEN];
+	struct_group(addrs,
+		u8 addr1[ETH_ALEN];
+		u8 addr2[ETH_ALEN];
+		u8 addr3[ETH_ALEN];
+	);
 	__le16 seq_ctrl;
 	u8 addr4[ETH_ALEN];
 } __packed __aligned(2);
diff --git a/net/wireless/lib80211_crypt_ccmp.c b/net/wireless/lib80211_crypt_ccmp.c
index 6a5f08f7491e..21d7c39bb394 100644
--- a/net/wireless/lib80211_crypt_ccmp.c
+++ b/net/wireless/lib80211_crypt_ccmp.c
@@ -136,7 +136,8 @@ static int ccmp_init_iv_and_aad(const struct ieee80211_hdr *hdr,
 	pos = (u8 *) hdr;
 	aad[0] = pos[0] & 0x8f;
 	aad[1] = pos[1] & 0xc7;
-	memcpy(aad + 2, hdr->addr1, 3 * ETH_ALEN);
+	BUILD_BUG_ON(sizeof(hdr->addrs) != 3 * ETH_ALEN);
+	memcpy(aad + 2, &hdr->addrs, ETH_ALEN);
 	pos = (u8 *) & hdr->seq_ctrl;
 	aad[20] = pos[0] & 0x0f;
 	aad[21] = 0;		/* all bits masked */
-- 
2.30.2

