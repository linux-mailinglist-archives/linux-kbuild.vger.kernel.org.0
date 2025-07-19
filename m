Return-Path: <linux-kbuild+bounces-8069-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C99B0B075
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 16:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A423B66D6
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 14:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704D8126BF7;
	Sat, 19 Jul 2025 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7k2s5oN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079905479B;
	Sat, 19 Jul 2025 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752935541; cv=none; b=datWUVZdLuZX9Xi8zP/q3l9ZLqXl1JzPuqkbfsZwTtJEAlFro6GOsm8kfzhiyqT7tCbbptbIcDI/TzgnY1i+n/vUPxQLWiqum0jk5cqKA1PGHiHlsbPQjfS8+Z4OlJ1IIV8EiDBHuIubyx6FkgFBJ48H7UNs0jTAadf76767dOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752935541; c=relaxed/simple;
	bh=V+cqlAHvyL6c/ohKdJfzOjs77XVYpRYB/WRjplcnoCg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F/E9lUE5+uQsi7UEAAMwHnyPNyk8sZwKRmekxVukUKHKYCyE1lpPXqisieM025g/+d+zDsQ3ugnJ8VSJwGwG0+Ps+ykFHoIlDmBrxxHfrIcYu6VMtyL+syG03hIfXuj4I9RmcEM3XtaPPXajlB7fNhWATRBtBEkask8Dfig1eNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7k2s5oN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74ce477af25so1988838b3a.3;
        Sat, 19 Jul 2025 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752935538; x=1753540338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQBjRnreXxOAnskMzQcqhE92/7vDfe3b61ckiq4cRzU=;
        b=a7k2s5oNLp6CjXQdHn/kFRwfHWkk2Pj0XFoKapwQsU/VHSYKSN5Z3BmMXRYvUTszq+
         AdOPXOLH+Fcmi/Q9h9quXZ9s2mAx9VEiQN/XNkS61hZ12L28g30VtZecxiSYGyfzKi/k
         rGeQCctzHqjhU3EdvrAqb+5sZYmyNdbDhXBQoo5iJEkkEHEaWe1nJISr/C86RhrZb0GP
         uYjbC9tZxcGGfWElRXQgeoE3LrNM4lIFxnzdY/L8mnM0Q+/xkfHK/A2NFSl/0csz+8IX
         k3jJ1ena9LAaCkcOOoHidVTpOCqXuhEzw3sU7PSHe0uNyljnEeEasPIoHcqxsId1A5BI
         rHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752935538; x=1753540338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQBjRnreXxOAnskMzQcqhE92/7vDfe3b61ckiq4cRzU=;
        b=hvlIkrgnrJQcToP/t2T5aKv+sIpVOxdfkXzDsZB/CMMb+EG1MJ6H9yZohN7Iuy8Gwe
         PoSWg+P0Aquv9hhYXHgSZfGGprIfIH6z12BFV0+ud0onp8qDwSydmaGdBffQ2Wg5rnZ6
         LRw+k1yAXVibBYkN6ZvHCWIoEUDQI/v1XVIBDgOVkszycv7zET8dHLRj0+Ea3MN3LiVH
         vk66YF75gc05jeOditpTq76V+omyiGjiGnXU0Lps6aNc8HTz5sYc75227WOi+3IIVImG
         XUzynZY/xxxcUBi85qofjBO1uI5ZhIraQntc6sY6RkQQm8YMDpCLPJ6iVi5LgneFr7DP
         FjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9dt8OiCil4mzaYDOJw8gwxGrQmXbDMOSxbVm2SHIbnWVJd45ku4636jA5bEDXr6zN2EINY6O7dHKmVvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjWQ2GeUHPgxG452vBC83pAjmHOkrY5nlru2XaNaLWR+05zsN
	UJrxr0MVsMHMQgNNeNhtWGH2SoXeW3khTU5rOioPTqD4mKYd7AkozaPE7Ieaaw==
X-Gm-Gg: ASbGncstVbYFWItsPtnvnSwRIWHuuMKb2LHVpTLknH/fOkqsYUIq5a8XURHy2c2PR0W
	RZzUDcSQolCIT6OWBf/6uIDuQRVl4zjb76lRLP0hZ04ATnm/chojW+mUHkYlwrvAQN1W7Ug+TV8
	fWskDTTiVjE4aLGNT5Y9FSQIFe6LsMeR5SRdpOJmjMmwCOwFEQi2v/DUakDK5KrWZTbsSEbac3K
	eFyMccVDr/NS0ZhxDLCVpc7t2AdEsjDKhpCpLsp5RTcm4fF7BEfCt9GngdI9Aa4FJMg923Uhm1w
	ePFBsesy/k5gZ/ytn/WEPd4PzRjTF0h4jeAA1KGbVS2Lfajk2utDUBY6jQh3851JvU01VR6/5MQ
	Wl2GngwHGr/pd0eGhIlpqXVT1zhewn9mV28f+
X-Google-Smtp-Source: AGHT+IE34Sc2Ts0uwneG0QWgzhLn24VuOpMD0GPaeFLyq22UDcU3Y5hEKJcAMpBdLOBjefH77/Ncag==
X-Received: by 2002:a05:6a20:3c8d:b0:222:1802:2ddb with SMTP id adf61e73a8af0-23810667018mr22218551637.8.1752935537837;
        Sat, 19 Jul 2025 07:32:17 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb76d5d8sm2912668b3a.112.2025.07.19.07.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 07:32:17 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kconfig: nconf: Fix uncleared lines on help screens
Date: Sat, 19 Jul 2025 20:02:07 +0530
Message-Id: <20250719143207.215020-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 1b92b18ec419 ("kconfig: nconf: Ensure null termination where
strncpy is used")
introduced a regression where help screens (F1, F2, F3) no longer properly 
clear short lines of text,
resulting in duplicated or trailing content when lines are overwritten.

Revert the null-termination change to match
the actual length of the copied string.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 1b92b18ec419 ("kconfig: nconf: Ensure null termination where strncpy is used")
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
I apologise for the overlook from my side. This should set it right.
Link of the report : 
https://lore.kernel.org/lkml/CAK7LNAT54nvwYmTy20Ep8U2kr4thn68yYWXi9R-d3Yx3iXs=Bg@mail.gmail.com/T/#
---
 scripts/kconfig/nconf.gui.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 475a403ab8ba..7206437e784a 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -177,7 +177,7 @@ void fill_window(WINDOW *win, const char *text)
 		const char *line = get_line(text, i);
 		int len = get_line_length(line);
 		strncpy(tmp, line, min(len, x));
-		tmp[sizeof(tmp) - 1] = '\0';
+		tmp[len] = '\0';
 		mvwprintw(win, i, 0, "%s", tmp);
 	}
 }

base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
-- 
2.34.1


