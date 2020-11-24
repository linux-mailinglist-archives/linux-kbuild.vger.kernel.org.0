Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03DA2C2FE9
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 19:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390777AbgKXSYf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 13:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390718AbgKXSYe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 13:24:34 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52404C0617A6
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 10:24:34 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id s9so17998877qks.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 10:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=bd5sh7vQZeJyURROHVUKNFVm+4CMC4yXrKfm9zRiuIw=;
        b=jtRiTvw4fvJnd8DziMdUXlCVFNCxntTtTEvtSJrNcKeRrhRHR3K7WGYLLYdsza+f4N
         N/uGa/v/4xLQsMFh7RsLQiVtuG/ZXSiTDwH6O+ALWJbcqXrWWWwQ7Gc3tJtunK/zjxFr
         kjgSye0YAVBFhS8TrvTa2ZNIRGGM9akI1KCkUnPoOJRydoP2jYuYYYxq98bhA6Y81soc
         ttScEDR4AP3UcSRGoypJccYQb0thq5eHpjV/mV59aLdmw6NAp3epLeksBsojGYyXxRF7
         eMEdElBWlvfB35RzG0ijynD/W1zGbtLcLoSzLCZ6wQSivuIrsUmA438/yMznm0Us/uQn
         X32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=bd5sh7vQZeJyURROHVUKNFVm+4CMC4yXrKfm9zRiuIw=;
        b=V/PXf5ukXV42BA58kUTuQ9faLRc/bX3Ge7yuoidWd8TY5weZtk2+6evW6XRknxq6Ak
         zvjbsk8BuwFilOgM7wfHjxENgzDfhKFzD9/Ax48LWONuu2gA0l3/6SwCbajI9fDT7Jts
         INMSjB1zpaJYajQXCrgWgzwhVLLLi7cHR5TNAUlX1MSPpoP4q//NfzzimACvi0P/otTN
         JTXPuDPlaX/leHljPlJSZ2VfCBJdi9k6MeGhT97qX1hGz3m15OYj+K+kWxNfqyfR0hMO
         jP40huvk6svg1LG3eHzYhvtE2E/YMV1xiboQ0Pkz/xTVDQDL+KdoHypnV5dNHDMQduD8
         npgg==
X-Gm-Message-State: AOAM530+grwvACcMH+16bEx55VJzNIYjPUSwaMS25TVF1T1j20XXg7hl
        lBaqRk6izWIh07fHH7/NIPqAACiXncgT
X-Google-Smtp-Source: ABdhPJyWTjMfWiYOVU+tE9pGSMeFoQRdhPtgSC6RhFbVbNV7o45purcv6ubLeMy+ZrK1ckQQwFWmaw6YrQZY
Sender: "qperret via sendgmr" <qperret@luke.lon.corp.google.com>
X-Received: from luke.lon.corp.google.com ([2a00:79e0:d:210:f693:9fff:fef4:a7ef])
 (user=qperret job=sendgmr) by 2002:a0c:eac4:: with SMTP id
 y4mr6136966qvp.19.1606242273407; Tue, 24 Nov 2020 10:24:33 -0800 (PST)
Date:   Tue, 24 Nov 2020 18:24:09 +0000
Message-Id: <20201124182420.2202514-1-qperret@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH] modpost: Make static exports fatal
From:   Quentin Perret <qperret@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, kernel-team@android.com,
        Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Using EXPORT_SYMBOL*() on static functions is fundamentally wrong.
Modpost currently reports that as a warning, but clearly this is not a
pattern we should allow, and all in-tree occurences should have been
fixed by now. So, promote the warn() message to fatal() to make sure
this never happens again.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 scripts/mod/modpost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f882ce0d9327..70b0e825a139 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2663,9 +2663,9 @@ int main(int argc, char **argv)
 
 		for (s = symbolhash[n]; s; s = s->next) {
 			if (s->is_static)
-				warn("\"%s\" [%s] is a static %s\n",
-				     s->name, s->module->name,
-				     export_str(s->export));
+				fatal("\"%s\" [%s] is a static %s\n",
+				      s->name, s->module->name,
+				      export_str(s->export));
 		}
 	}
 
-- 
2.29.2.454.gaff20da3a2-goog

