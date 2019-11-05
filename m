Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB10EFEED
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 14:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389067AbfKENrq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 08:47:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34824 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388615AbfKENrq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 08:47:46 -0500
Received: by mail-wm1-f67.google.com with SMTP id 8so13186452wmo.0
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Nov 2019 05:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nZ0NtyKlN0mECHG4PVEtPii79ddIWJ/dNETUstyjSo4=;
        b=WzMofGxaV4+waE9HFVg1hUeiDUkLmUiD8evWbx47N6a73UjVCKy5N69mB9gYIIbETC
         yn6ZaRoNcnv/5nRk5ZWIwzrIHfjBOOyK4ILGbAlAU0yTaBdDkM7UrZpZ9oIAcdnWlidk
         1RFYtnbxSXEpF/Nv15GC0/Sm9nCQCGI3IQaVxkmXnS7lofKPTn8Ob08efu0TyN1iGrfY
         jbP0qjEfX8LUQH463Ox5r1OUv9aByO155IFwD7KIMCxkQe02cnZxZQQwFe7PqoVRzENi
         bVHgEBL59zCUcGveUFQUxd2dKviPjJqW9n4E4QuogiA3f/5RkOmA03w/D2zsvEFpXM6f
         f4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nZ0NtyKlN0mECHG4PVEtPii79ddIWJ/dNETUstyjSo4=;
        b=NnUozPvnkLvZPIzZ55gHUMrKZIGCGQcdflzlXjm1BR7StGGFT7ZXSTscyPeMfthrC3
         W4VfP6TdBQ5VEtHetFHZnVb753vLGMUyjXch9cNTGCzW8pKez7e5TOqZp/jM1TsIOOzx
         guxEmUaUknV2zE7Fk3zmjtfm3IydpHLlGFOyicx3FqSdHbBLCIOb/il87Bxw/reIx0eY
         CnsCnKwkV6KtRSedwa6UOQb8eX0Nzk+9DQnU3U0gDg9MMwMjST70CvpDzYQSd3FSY1VX
         xioAZTDcGoIjL/KcuRP1qn2t0ThIQ16I1ygAR760SWGcGokb5coiiLAob4oYaKV/R170
         iVrg==
X-Gm-Message-State: APjAAAVSIlaFkyPr3CEJnIioEO5En9wQCFj7qrdGCXDZ7XkA/gCw5oKK
        21fNVbmjBWMFOOQPso+XzApOXw==
X-Google-Smtp-Source: APXvYqz6TwrUtKtwRhKyTrjAPt8ruFrngSCuQfZKpEY7AkKWkRgK1SLBJ7dRQ+2weGZP3OT233hU2A==
X-Received: by 2002:a1c:b404:: with SMTP id d4mr4598549wmf.9.1572961663785;
        Tue, 05 Nov 2019 05:47:43 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id q25sm25737207wra.3.2019.11.05.05.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 05:47:42 -0800 (PST)
Date:   Tue, 5 Nov 2019 13:47:42 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mospost: remove unneeded local variable in
 contains_namespace()
Message-ID: <20191105134742.GC65671@google.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-5-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-5-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!

On Tue, Oct 29, 2019 at 09:38:09PM +0900, Masahiro Yamada wrote:
>The local variable, ns_entry, is unneeded.
>
>While I was here, I also cleaned up the comparison with NULL or 0.
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---

This was not directly sent to me, hence I missed it.
Nevertheless, please feel free to add

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias
>
> scripts/mod/modpost.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index f7425f5d4ab0..f70b924f379f 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -239,10 +239,8 @@ static struct symbol *find_symbol(const char *name)
> static bool contains_namespace(struct namespace_list *list,
> 			       const char *namespace)
> {
>-	struct namespace_list *ns_entry;
>-
>-	for (ns_entry = list; ns_entry != NULL; ns_entry = ns_entry->next)
>-		if (strcmp(ns_entry->namespace, namespace) == 0)
>+	for (; list; list = list->next)
>+		if (!strcmp(list->namespace, namespace))
> 			return true;
>
> 	return false;
>-- 
>2.17.1
>
