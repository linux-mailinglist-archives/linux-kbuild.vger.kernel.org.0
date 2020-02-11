Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B541589B7
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 06:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgBKFoj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Feb 2020 00:44:39 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37294 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbgBKFoj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 00:44:39 -0500
Received: by mail-wr1-f67.google.com with SMTP id w15so10650111wru.4
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 21:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VF1bXPK5oEmTt3ZiFcaHZFV+yxaXGNeTcRvRNXdxka0=;
        b=KMH574uU0/our/bWIDk7tjF0CUOpdqEXUyxAO0039Q/ScMEEx/kWVTsxYYA62OIBMJ
         D16sPI+yXivoWONcUrA3xZdL1rUTPPpeYcz3nbmI9zgy/a73ecyPFyXmZCLaAdcXYB69
         i3a0KOmy8IF5CZWW3RTO97fleUVR86S00gILgYTZX8Tf5owMYqqc1uN/yKx5RdUKC0Fe
         sb9V24tq0qXoUhCWeN/C7meMGS5QYDDdZEvzasbVecYNr5jCa7daRa85QkGFi7cxwFSv
         6NmstJd1m3eGbo0YNpZRAAtB8eQtI/59xiKQRLGkXIJKl+7MqDuqQ3uCwYQzRC6W5vIK
         o3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VF1bXPK5oEmTt3ZiFcaHZFV+yxaXGNeTcRvRNXdxka0=;
        b=i0WidZe/LmrUFqyXwqtZbQemQ7yaRk+/Gw4LrqyTQEd/lWtYhsXOKsZ+gdSDnKx1Os
         KQpMe8wROVgnJ+VvAhlcmq4BpZN8IVRjihdc2y74V/Q030fn71/F0+pWJVhVrpf4nXkN
         0IwEkTwjPwD1aSSuQH4eZXMrI9SKNbi+hoI7k8T/kDSocB2+uH52hcM6uEuQcARFLDdi
         CT0e8R2I0wkdfCgM5gKskxjwaY3N4eTHc9S0VNFsP9Ov13C+ZJ/OxFLY/ZDdD80oXUzH
         UAAN9SEFXc7UohyjqgYGL7jQDGRn5Cx2FCggtn38cMIMArHdAjSbUF4m/cAicZHFRij7
         A1lA==
X-Gm-Message-State: APjAAAV6qDBSyv79MqPSQj2DGmXJ0aHoeUcxpKj4cEUNGcJbTREUsP1A
        J+0RWRrDPNrZiiSq0WUfE0P7lQ==
X-Google-Smtp-Source: APXvYqwAHVf5Ta/OFH/ILekJE7pefp/yafQSgOec2ohu/cK71immVVEQjkV4APbEK3wz/hDLs6Eegw==
X-Received: by 2002:adf:cd11:: with SMTP id w17mr6669549wrm.66.1581399877026;
        Mon, 10 Feb 2020 21:44:37 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id h10sm2283730wml.18.2020.02.10.21.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 21:44:36 -0800 (PST)
Date:   Tue, 11 Feb 2020 05:44:33 +0000
From:   Quentin Perret <qperret@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200211054433.GB72419@google.com>
References: <20200207180755.100561-1-qperret@google.com>
 <20200207180755.100561-2-qperret@google.com>
 <CAK7LNASMeXjxaj2Hbh420bxBZqVUoa87PtBuu38+fB6aZgJTXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASMeXjxaj2Hbh420bxBZqVUoa87PtBuu38+fB6aZgJTXg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Saturday 08 Feb 2020 at 06:05:02 (+0100), Masahiro Yamada wrote:
> On Fri, Feb 7, 2020 at 7:08 PM Quentin Perret <qperret@google.com> wrote:
> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > index a904bf1f5e67..58335eee4b38 100755
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -38,6 +38,10 @@ esac
> >  # We need access to CONFIG_ symbols
> >  . include/config/auto.conf
> >
> > +# The symbol whitelist, relative to the source tree
> > +eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
> 
> What is this 'eval' needed for?
> 
> This worked for me without it.

Right, it is there to expand the path in cases where the user sets the
option to "~/my_whitelist" for instance. That could most certainly use a
comment, though.

Thanks,
Quentin
