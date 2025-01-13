Return-Path: <linux-kbuild+bounces-5455-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87933A0BB43
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 087E41884F04
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CC923D3EF;
	Mon, 13 Jan 2025 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSSVnEQ8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8E23D3E9;
	Mon, 13 Jan 2025 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780591; cv=none; b=a+A6OkvVZ+7sVtbCGygbqNe5sgH6BS+xkZM7Iwla9lhKfc285kN9xUwgqsMS6LahK9skmlx3hmDPez8r1L2HjwgeLbeDxV2u561WETYeKvPUItQxHx6LJxSdymPtUABDr+QJJpM66Kpy0cuoZLP9xmoj4JX9z/oS1TFDgzgO+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780591; c=relaxed/simple;
	bh=RiN/aonjOGuE8UTKv6uSZEanQjGJXSf0h64lzIRusSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+b32OyNCZjr23r5x84PrHIe5LkCcUcRUz6L8LF2pRlgqiW8kGdXZDhWV0jvBuOPk/d6Vk4pq+rlRtsr7wjjk+uDqkCaXs2r+I0GVOC86zSJlqTjm0dII4Q3COVgK4zA8MlmKcxw4xItA21sJzq+XYW9JPPzl/mQJC14MQKh+5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSSVnEQ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF93C4CEE2;
	Mon, 13 Jan 2025 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780590;
	bh=RiN/aonjOGuE8UTKv6uSZEanQjGJXSf0h64lzIRusSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSSVnEQ83o2jcOtXjKdeit1krsPUhKKU/H5EJa2Bd+f/9A1WgxKsu734qK7dnN6Qc
	 p/8ym/8yEkQg2tE6fQz7UVC5cwq9mHK41RswxrW7TjQUZ7ZfJY4/toIFAVxy3HMW/U
	 8ql+5uYFtUfndOJVQtVrK8FiNcaeGzMR8pPg047Iuf5vq0KfufkU9+I2dMxV2mff6o
	 pLk6H3TmKoNEpqZdYLIwql+gKx4B1BcvX29CHCjiMGPhBButUvIj9K6htEr23EZaZ5
	 viaZz29gA3CGN15fXd9cnSVHlsuApH80X/7EVPAo2T8dk6vAu6jVx+R7i+gpd7LT7Q
	 b0L0cIIThBBUA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 07/17] genksyms: restrict direct-abstract-declarator to take one parameter-type-list
Date: Tue, 14 Jan 2025 00:00:45 +0900
Message-ID: <20250113150253.3097820-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113150253.3097820-1-masahiroy@kernel.org>
References: <20250113150253.3097820-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While there is no more grammatical ambiguity in genksyms, the parser
logic is still inaccurate.

For example, genksyms accepts the following invalid C code:

    void my_func(int ()(int));

This should result in a syntax error because () cannot be reduced to
<direct-abstract-declarator>.

( <abstract-declarator> ) can be reduced, but <abstract-declarator>
must not be empty in the following grammar from K&R [1]:

  <direct-abstract-declarator> ::=  ( <abstract-declarator> )
                                 | {<direct-abstract-declarator>}? [ {<constant-expression>}? ]
                                 | {<direct-abstract-declarator>}? ( {<parameter-type-list>}? )

Furthermore, genksyms accepts the following weird code:

    void my_func(int (*callback)(int)(int)(int));

The parser allows <direct-abstract-declarator> to recursively absorb
multiple ( {<parameter-type-list>}? ), but this behavior is incorrect.

In the example above, (*callback) should be followed by at most one
(int).

[1]: https://cs.wmich.edu/~gupta/teaching/cs4850/sumII06/The%20syntax%20of%20C%20in%20Backus-Naur%20form.htm

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index fafce939c32f..03cdd8d53c13 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -381,20 +381,24 @@ abstract_declarator:
 	;
 
 direct_abstract_declarator:
+	direct_abstract_declarator1
+	| direct_abstract_declarator1 open_paren parameter_declaration_clause ')'
+		{ $$ = $4; }
+	| open_paren parameter_declaration_clause ')'
+		{ $$ = $3; }
+	;
+
+direct_abstract_declarator1:
 	  IDENT
 		{ /* For version 2 checksums, we don't want to remember
 		     private parameter names.  */
 		  remove_node($1);
 		  $$ = $1;
 		}
-	| direct_abstract_declarator open_paren parameter_declaration_clause ')'
+	| direct_abstract_declarator1 open_paren error ')'
 		{ $$ = $4; }
-	| direct_abstract_declarator open_paren error ')'
-		{ $$ = $4; }
-	| direct_abstract_declarator BRACKET_PHRASE
+	| direct_abstract_declarator1 BRACKET_PHRASE
 		{ $$ = $2; }
-	| open_paren parameter_declaration_clause ')'
-		{ $$ = $3; }
 	| open_paren abstract_declarator ')'
 		{ $$ = $3; }
 	| open_paren error ')'
-- 
2.43.0


