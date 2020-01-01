Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B70512E077
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jan 2020 22:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgAAVEd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jan 2020 16:04:33 -0500
Received: from zeniv.linux.org.uk ([195.92.253.2]:58440 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgAAVEd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jan 2020 16:04:33 -0500
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1imlAI-000GeY-2c; Wed, 01 Jan 2020 21:04:26 +0000
Date:   Wed, 1 Jan 2020 21:04:26 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] menuconfig: restore prompt dependencies in help text
Message-ID: <20200101210426.GA8904@ZenIV.linux.org.uk>
References: <20191231055839.GG4203@ZenIV.linux.org.uk>
 <20200101204152.402906-1-nivedita@alum.mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200101204152.402906-1-nivedita@alum.mit.edu>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 01, 2020 at 03:41:52PM -0500, Arvind Sankar wrote:
> Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
> prompts") moved some code from get_prompt_str to get_symbol_str so that
> dependency information for symbols without prompts could be shown.
> 
> This code would be better copied rather than moved, as the change had
> the side-effect of not showing any extra dependencies that the prompt
> might have over the symbol.
> 
> Put back a copy of the dependency printing code in get_prompt_str.

Umm... Is "visible" really accurate in this case?  AFAICS, the
entry (and help for it) _is_ visible with EXPERT=n.  OTOH, with
EXPERT=y and MULTIUSER=n it disappears completely.

I'm not familiar with kconfig guts (and not too concerned about that
feature of help there, TBH), but it looks like what you are printing
there is some mix of dependencies ("visible when") and selectability...
